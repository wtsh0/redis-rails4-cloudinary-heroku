module Public::ArticlesHelper
  def dispImage(article)
    if image.present?
      image_tag article.picture_url, width: 100
    else
      image_tag('/assets/no-image.png', width: 100, height: 100)
    end
  end
end
