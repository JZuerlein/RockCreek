class SignupConfirmationsController < ApplicationController
  def new
  end

  def show
  end

  def edit
    # the ! raises a 404 if not found.
    @signup = Signup.find_by_email_confirmation_token!(params[:id])
  end

  def update
    @signup = Signup.find_by_email_confirmation_token!(params[:id])

    # create the tenant record
    @tenant = Tenant.new(:name => @signup.company, :subdomain => @signup.site_address)
    @tenant.save

    # set the confirmed field on the user record.
    @user = User.find_by_email!(@signup.email)
    if @user.update_attributes(:tenant_id => @tenant.id, :first_name => @signup.first_name, :last_name => @signup.last_name, :confirmed => TRUE)
      session[:user_id] = @user.id
      #current_user

      #user_group_assignments
      #the first user to a subdomain should be an administrator.
      @assignment = UserGroupAssignment.new(:user_id => @user.id, :group_id => 1, :tenant_id => @tenant.id)
      @assignment.save

      redirect_to root_url(subdomain: @tenant.subdomain) +"/signup_confirmations/show.html"
    else
      render :edit
    end

    # link the user to the tenant

  end
end
