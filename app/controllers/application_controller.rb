class ApplicationController < ActionController::Base
  protect_from_forgery

  around_filter :scope_current_tenant
  before_filter :authorize

  delegate :allow?, to: :current_permission
  helper_method :allow?

  delegate :allow_param?, to: :current_permission
  helper_method :allow_param?

  private

  def current_user
    ## @ means it is an instance variable
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def is_member_of_admin
    @current_user.is_member_of_admin
  end
  helper_method :is_member_of_admin


  def current_resource
    nil
  end

  def authorize
    if current_permission.allow?(params[:controller], params[:action], current_resource)
      current_permission.permit_params! params
    else
      redirect_to root_url, alert: "Not authorized."
    end
  end

  def current_tenant
    Tenant.find_by_subdomain request.subdomain
  end
  helper_method :current_tenant

  def scope_current_tenant
    if current_tenant.nil?
      Tenant.current_id = -1
    else
      Tenant.current_id = current_tenant.id
    end
    yield
  ensure
    Tenant.current_id = nil
  end
end
