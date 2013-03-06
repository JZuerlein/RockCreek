class SignupMailer < ActionMailer::Base
  default from: "administrator@mychangecontrol.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.signup_mailer.email_confirmation_request.subject
  #
  def email_confirmation_request(signup)
    @signup = signup
    mail to: signup.email, :subject => "Signup Confirmation"
  end
end
