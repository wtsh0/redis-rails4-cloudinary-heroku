class Article < ActiveRecord::Base
  # image_uploader(cloudinary)
  attr_accessor :image
  mount_uploader :image, ArticleimageUploader
  def check_published_at
    self.published == true ? self.published_at = Time.now : self.published_at = ""
  end
end
