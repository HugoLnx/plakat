class PosterImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :fog

  process resize_to_fit: [640, 960]

  version :small do
    process resize_to_fit: [320, 480]
  end

  version :with_text do
    process :draw_text
  end

  def store_dir
    "uploaded_posters/"
  end
private
  def draw_text
    manipulate! do |img|
      img.combine_options do |c|
        c.gravity 'Center'
        c.pointsize '70'
        c.draw "text 0,0 '#{model.description}'"
        c.fill 'white'
      end
      img
    end
  end
end
