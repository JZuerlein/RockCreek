class ChangeRequest < ActiveRecord::Base
  attr_accessible :requester_id, :assigned_to, :change_type, :description, :due_date, :request_date, :status, :summary
  default_scope { where(tenant_id: Tenant.current_id)}

  has_many :request_responses

  def requester_name
    User.find(requester_id).full_name
  end

  def assigned_to_name
    User.find(assigned_to).full_name
  end

  def can_edit(user)
    return ((requester_id == user.id) || user.is_member_of_change_control || (assigned_to == user.id)) && (status == "New" || status == "Modified")
  end

  def available_commands(user)
    @available_commands = []

    if transition_to?("Submitted", user)
      @available_commands.push("Submit")
    end

    if transition_to?("Approved", user)
      @available_commands.push("Approve")
    end

    if transition_to?("Denied", user)
      @available_commands.push("Deny")
    end

    if transition_to?("Modified", user)
      @available_commands.push("Modify")
    end

    if transition_to?("Completed", user)
      @available_commands.push("Complete")
    end

    return @available_commands
  end

  def approve(user)
    if transition_to?("Approved", user)
      response = self.request_responses.find { |e| e.user_id == user.id}
      response.response = "Approved"
      response.save

      #(self.request_responses.find { |e| e.user_id == user.id}).response = "Approve"

      all_approved = true
      request_responses.each do |request_response|
        if (request_response.response != "Approved")
          all_approved = false
        end
      end

      if all_approved
        self.status = "Approved"
      end
      self.save
    end
  end

  def deny(user)
    if self.status == "Submitted"
      response = self.request_responses.find { |e| e.user_id == user.id}
      response.response = "Deny"
      response.save

      all_denied = true
      request_responses.each do |request_response|
        if (request_response.response != "Deny")
          all_denied = false
        end
      end

      if all_denied
        self.status = "Denied"
      end
      self.save


    end
  end

  def submit(user)
    if transition_to?("Submitted", user)
      self.status = "Submitted"
      self.save
    end
  end

  def modify(user)
    if transition_to?("Modified", user)
      self.request_responses.each do |request_response|
        request_response.response = "reset due to modification"
        request_response.save
      end
      self.status = "Modified"
      self.save
    end
  end

  def complete(user)
    if transition_to?("Completed", user)
      self.status = "Completed"
      self.save
    end
  end

  def transition_to?(new_state, user)

    return true if status == "New" && new_state == "Submitted" && user.id == requester_id
    return true if status == "Submitted" && new_state == "Modified" && user.id == requester_id
    return true if status == "Approved" && new_state == "Modified" && user.id == requester_id
    return true if status == "Denied" && new_state == "Modified" && user.id == requester_id
    return true if status == "Modified" && new_state == "Submitted" && user.id == requester_id
    return true if status == "Approved" && new_state == "Completed" && user.id == assigned_to

    request_response = self.request_responses.find { |e| e.user_id == user.id}

    #request_response will be nil for users who are not part of the change control group but can access show change control
    if request_response != nil
      return true if status == "Submitted" && new_state == "Approved" && request_response.response != "Approved"
      return true if status == "Submitted" && new_state == "Denied" && request_response.response != "Deny"
    end

    return false
  end

  #def initialize
  #    allow :create, [:submitted]
  #    allow :submitted, [:approved, :denied, :modified, :recalled]
  #    allow :recalled, [:submitted]
  #    allow :modified, [:recalled]
  #    allow :denied, [:modified]
  #    allow :approved, [:completed, :modified]
  #end

  def allow(states, transition_to)
    @allowed_transitions ||= {}
    Array(states).each do |states|
      Array(transition_to).each do |transition|
        @allowed_transitions[[states.to_s, transition.to_s]] = true
      end
    end
  end

end
