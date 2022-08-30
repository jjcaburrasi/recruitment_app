class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_challenge.subject
  #

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_challenge.subject
  #
  def send_challenge(user, app)
    @greeting = "Hello #{user.name}"
    @position = app.job.title
    
    if app.stage.challenge_file.attached?
      attachments['challenge.pdf'] = File.read(app.stage.challenge_path) 
      @content = "The attached file is a coding challenge to solve at this stage of the selection process."
    end

    mail to: user.email
  end

  def send_application(user, app)
    @greeting = "Hello #{user.name}"
    @position = app.job.title

    mail to: user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_offer.subject
  #
  def send_offer(user, offer)
    @greeting = "Hello #{user.name}"
    @position = offer.job.title
    @content = offer.content
    mail to: user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reject_candidate.subject
  #
  def reject_candidate(user, job)
    @greeting = "Hello #{user.name}"
    @position = job.title
    mail to: user.email
  end
end
