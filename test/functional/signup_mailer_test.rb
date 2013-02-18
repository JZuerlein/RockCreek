require 'test_helper'

class SignupMailerTest < ActionMailer::TestCase
  test "email_confirmation_request" do
    mail = SignupMailer.email_confirmation_request
    assert_equal "Email confirmation request", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
