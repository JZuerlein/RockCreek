class InvitationMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.signup_mailer.email_confirmation_request.subject
  #
  def email_invitation_request(invite_user)
    @invite_user = invite_user
    mail to: invite_user.email, :subject => "Invitation"
  end

end
