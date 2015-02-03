class PosterImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :large do
    process resize_to_fit: [640, nil] # Resize to specific width and adjust height
  end

  version :small do
    process resize_to_fit: [380, nil]
  end

  def store_dir
    "uploaded_posters/"
  end
end
