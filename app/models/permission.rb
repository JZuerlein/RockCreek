class Permission < Struct.new(:user)
  def allow?(controller, action)
    return true if controller == "sessions"
    return true if controller == "users" && action.in?(%w[new create])
    false
  end
end