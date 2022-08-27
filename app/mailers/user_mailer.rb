class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_challenge.subject
  #
  def send_challenge(user, app)
    @greeting = "Hi #{user.name}"
    @position = "You have applied to #{app.job.title} position."
    attachments['challenge.pdf'] = File.read(app.stage.challenge_path) if app.stage.challenge_file.attached?
       
    mail to: user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_offer.subject
  #
  def send_offer
    @greeting = "Hi #{user.name}"

    mail to: user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reject_candidate.subject
  #
  def reject_candidate
    @greeting = "Hi #{user.name}"

    mail to: user.email
  end
end
