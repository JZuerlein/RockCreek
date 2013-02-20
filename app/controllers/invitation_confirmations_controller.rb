class InvitationConfirmationsController < ApplicationController

  def new

  end

  def edit
    # the ! raises a 404 if not found.
    session[:user_id] = nil
    reset_session
    @invite_user = InviteUser.find_by_email_invitation_token!(params[:id])
  end

  def update
    @invite_user = InviteUser.find_by_email_invitation_token!(params[:id])

    #@tenant = Tenant.find_by_subdomain!(params[:subdomain])

    # set the confirmed field on the user record.
    @user = User.new(:password => params[:invite_user][:password], :password_confirmation => params[:invite_user][:password_confirmation], :email => params[:invite_user][:email], :first_name => params[:invite_user][:first_name], :last_name => params[:invite_user][:last_name], :tenant_id => params[:invite_user][:tenant_id], :confirmed => TRUE)

    if @user.save
      @invite_user.delete
      session[:user_id] = @user.id
      redirect_to "/signup_confirmations/show.html"
    else
      render :edit
    end

    # link the user to the tenant

  end

end
