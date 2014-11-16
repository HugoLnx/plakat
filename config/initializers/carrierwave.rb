require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                       # required
    :aws_access_key_id      => ENV['AWSKEY'],               # required
    :aws_secret_access_key  => ENV['AWSSECRETKEY']          # required
  }
  config.fog_directory  = 'plakat'                          # required
  config.fog_public     = true                                        # optional, defaults to true
  #config.fog_attributes = {'Cache-Control'=>"max-age=#{365.day.to_i}"} # optional, defaults to {}
end
