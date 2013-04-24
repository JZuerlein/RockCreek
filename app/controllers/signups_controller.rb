class SignupsController < ApplicationController
  def new
    @signup = Signup.new
    @signup.plan = Plan.find(params[:plan_id])

    @eventlog = Eventlog.new
    @eventlog.ip =  request.remote_ip
    @eventlog.action = "Visited Signup Page"
    @eventlog.controller = SignupsController.to_s
    @eventlog.save
  end

  def create
    @signup = Signup.new(params[:signup])
    @user = User.new(:email => params[:signup][:email], :password => params[:signup][:password], :password_confirmation => params[:signup][:password_confirmation])
    @signup.site_address = @signup.site_address.downcase

    if @user.save
      if @signup.save
        @signup.send_confirmation_request

        @eventlog = Eventlog.new
        @eventlog.ip =  request.remote_ip
        @eventlog.action = "Submitted Signup Form"
        @eventlog.controller = SignupsController.to_s
        @eventlog.save

        redirect_to root_url, :notice => "Please check you email for a confirmation request, and click on the link enclosed."
      else
        render "new"
      end
    else
        render "new"
    end
  rescue Stripe::CardError => e
    @signup.errors.add :base, e.message
    @signup.stripe_token = nil
    render :action => :new

  rescue Stripe::StripeError => e
    logger.error e.message
    @signup.errors.add :base, "There was a problem with your credit card."
    @sipnup.stripe_token = nil
    render :action => :new
  end

  def edit
    # the ! raises a 404 if not found.
    @signup = Signup.find_by_email_confirmation_token!(params[:id])
  end

  def update
    @signup = Signup.find_by_email_confirmation_token!(params[:id])

    # set the confirmed field on the user record.
    @user = User.find_by_email!(@signup.email)

    if @user.update_attributes(:tenant_id => @tenant.id, :confirmed => TRUE)
      redirect_to root_url, :notice => "Confirmation successful!"
    else
      render :edit
    end

  end

end
