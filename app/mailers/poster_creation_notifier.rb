class PosterCreationNotifier < ActionMailer::Base
  RECEIVER_EMAIL = "criativo-puc@googlegroups.com"
  SENDER_EMAIL = "plakat.contato@gmail.com"

  def notify(email: nil, poster_params: {})
    mail(to: RECEIVER_EMAIL, from: SENDER_EMAIL, subject: "Teste", body: "testing")
  end
end
