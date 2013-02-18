class InviteUser < ActiveRecord::Base
  attr_accessible :email, :email_invitation_sent_at, :email_invitation_token, :subdomain, :first_name, :last_name
  default_scope { where(tenant_id: Tenant.current_id)}

  def send_invitation_request
    generate_token(:email_invitation_token)
    self.email_invitation_sent_at = Time.zone.now
    save!
    InvitationMailer.email_invitation_request(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while InviteUser.exists?(column => self[column])
  end
end
