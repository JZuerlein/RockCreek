class Signup < ActiveRecord::Base
  attr_accessible :company, :email, :first_name, :last_name, :password, :password_confirmation, :site_address, :stripe_token, :last_four_digits
  attr_accessor :password, :password_confirmation, :stripe_token
  validates_presence_of :password, :on => :create

  def send_confirmation_request
    generate_token(:email_confirmation_token)
    self.email_confirmation_sent_at = Time.zone.now
    save!
    SignupMailer.email_confirmation_request(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Signup.exists?(column => self[column])
  end

end
