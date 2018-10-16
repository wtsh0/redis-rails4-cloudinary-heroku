module Public::ArticlesHelper
  def dispImage(image)
    if image.present?
      image_tag image.url, width: 100
    else
      image_tag('/assets/no-image.png', width: 100, height: 100)
    end
  end
end
