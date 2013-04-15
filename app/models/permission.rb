class Permission

  def initialize(user)
    allow :users, [:new, :create]
    allow :sessions, [:new, :create, :destroy]
    allow :home, [:index]
    allow :signups, [:new, :create, :edit]
    allow :signup_confirmations, [:edit, :update, :show]
    allow :invitation_confirmations, [:edit, :update]
    allow :admin, [:index]
    if user
      #allow :users, [:edit, :update]           Only ADMINs should be able to edit.
      allow :change_requests, [:index, :show, :new, :create]
      allow :change_requests, [:edit, :update] do |change_request|
        ((change_request.requester_id == user.id) || user.is_member_of_change_control || (change_request.assigned_to == user.id)) && (change_request.status != "Completed")
      end
      #allow_param :change_request, [:status] #if user.is_member_of_change_control
      allow :request_response, [:edit, :show, :new, :create, :update, :index] if user.is_member_of_change_control

      allow :dashboard, [:show]
      allow_all if user.is_member_of_admin
    end
  end

  def allow_all
    @allow_all = true
  end

  def allow(controllers, actions, &block)
    @allowed_actions ||= {}
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @allowed_actions[[controller.to_s, action.to_s]] = block || true
      end
    end
  end

  def allow?(controller, action, resource = nil)
    allowed = @allow_all || @allowed_actions[[controller.to_s, action.to_s]]
    allowed && (allowed == true || resource && allowed.call(resource))

    #return true if controller == "sessions"
    #return true if controller == "home" && action.in?(%w[index])

    #if user
    #  return true if controller == "change_requests" && action.in?(%w[index show new])
    #  return true if controller == "dashboard" && action.in?(%w[show])
    #  return true if user.is_member_of_admin
    #end

  end

  def allow_param(resources, attributes)
    @allowed_params ||= {}
    Array(resources).each do |resource|
      @allowed_params[resource] || []
      @allowed_params[resource] += Array(attributes)
    end
  end

  def allow_param?(resource, attribute)
    if @allow_all
      true
      elseif @allowed_params && @allowed_params[resource]
        @allowed_params[resource].include? attribute
    end
  end

  def permit_params!(params)
    if @allow_all
      params.permit!
    elsif @allowed_params
      @allowed_params.each do |resource, attributes|
        if params[resource].respond_to? :permit
          params[resource] = params[resource].permit(*attributes)
        end
      end
    end
  end
end