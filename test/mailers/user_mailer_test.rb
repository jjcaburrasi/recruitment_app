require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  def setup
    @user=User.new(name:"jojo", email:"ejemplo@ejemplo.com", password:"pepote")
    @app = Application.new(user_id: users(:jose).id,
                        job_id: jobs(:job1).id, stage_id: stages(:stage).id)

  end

  test "send_challenge" do
    mail = UserMailer.send_challenge(@user, @app)
    assert_equal "Send challenge", mail.subject
    assert_equal ["ejemplo@ejemplo.com"], mail.to
    assert_equal ['noreply@recruitmentapp.com'], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "send_offer" do
    mail = UserMailer.send_offer
    assert_equal "Send offer", mail.subject
    assert_equal ["ejemplo@ejemplo.com"], mail.to
    assert_equal ['noreply@recruitmentapp.com'], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "reject_candidate" do
    mail = UserMailer.reject_candidate
    assert_equal "Reject candidate", mail.subject
    assert_equal ["ejemplo@ejemplo.com"], mail.to
    assert_equal ['noreply@recruitmentapp.com'], mail.from
    assert_match "Hi", mail.body.encoded
  end

  # Example test "account_activation" do
  #   user = users(:michael)
  #   user.activation_token = User.new_token
  #   mail = UserMailer.account_activation(user)
  #   assert_equal "Account activation", mail.subject
  #   assert_equal [user.email], mail.to
  #   assert_equal ["noreply@example.com"], mail.from
  #   assert_match user.name, mail.body.encoded
  #   assert_match user.activation_token, mail.body.encoded
  #   assert_match CGI.escape(user.email), mail.body.encoded
  # end

end
