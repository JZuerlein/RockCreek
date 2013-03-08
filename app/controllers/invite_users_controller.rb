class InviteUsersController < ApplicationController
  before_filter :authorize, only: :edit


  # GET /invite_users/new
  # GET /invite_users/new.json
  def new
    @invite_user = InviteUser.new
    @outstanding_invitations = InviteUser.all
  end

  # POST /change_requests
  # POST /change_requests.json
  def create
    @invite_user = InviteUser.new(params[:invite_user])
    @invite_user.subdomain = current_tenant.subdomain
    @invite_user.tenant_id = Tenant.current_id

    if @invite_user.save
        @invite_user.send_invitation_request
        redirect_to :action => :new
        #redirect_to dashboard_path, :notice => "Please check you email for a confirmation request, and click on the link enclosed."
    else
        render "new"
    end
  end

  def destroy
    @invite_user = current_resource
    @invite_user.destroy

    redirect_to new_invite_user_url

  end

  def current_resource
    @current_resource ||= InviteUser.find(params[:id]) if params[:id]
  end

end
