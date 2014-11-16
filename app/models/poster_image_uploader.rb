class PosterImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :fog

  process resize_to_fit: [640, 960]

  version :small do
    process resize_to_fit: [320, 480]
  end

  def store_dir
    "uploaded_posters/"
  end
end