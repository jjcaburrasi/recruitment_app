# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/send_challenge
  def send_challenge
    UserMailer.send_challenge
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/send_offer
  def send_offer
    UserMailer.send_offer
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/reject_candidate
  def reject_candidate
    UserMailer.reject_candidate
  end

end
