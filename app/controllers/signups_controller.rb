class SignupsController < ApplicationController
  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(params[:signup])
    @user = User.new(:email => params[:signup][:email], :password => params[:signup][:password], :password_confirmation => params[:signup][:password_confirmation])

    if @user.save
      if @signup.save
        @signup.send_confirmation_request
        redirect_to root_url, :notice => "Please check you email for a confirmation request, and click on the link enclosed."
      else
        render "new"
      end
    else
        render "new"
    end


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
