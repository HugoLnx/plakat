require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',                       # required
      :aws_access_key_id      => ENV['AWSKEY'],               # required
      :aws_secret_access_key  => ENV['AWSSECRETKEY']          # required
    }
    config.fog_directory  = 'plakat'                          # required
    config.fog_public     = true                              # optional, defaults to true
  else
    config.storage = :file
    config.enable_processing = false
  end
end
