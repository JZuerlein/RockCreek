class ApplicationController < ActionController::Base
  protect_from_forgery

  #around_filter :scope_current_tenant

  private

  def current_user
    ## @ means it is an instance variable
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

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
