class PosterCreationNotifier < ActionMailer::Base
  RECEIVER_EMAIL = "criativo-puc@googlegroups.com"
  SENDER_EMAIL = "plakat.contato@gmail.com"

  def notify(email: nil, poster: nil)
    @poster = poster
    @user_email = email
    mail(to: RECEIVER_EMAIL, from: SENDER_EMAIL, subject: "[poster] #{poster.title}")
  end
end
