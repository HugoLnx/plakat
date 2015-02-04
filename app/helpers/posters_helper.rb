module PostersHelper
  def image_presence_class(image_url)
    image_url ? "with-image" : "without-image"
  end
end
