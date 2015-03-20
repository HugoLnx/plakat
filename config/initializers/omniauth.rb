Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  else
    provider :facebook, "1430101920620401", "de756468a2f920b494aa224e9230dc47"
  end
end
