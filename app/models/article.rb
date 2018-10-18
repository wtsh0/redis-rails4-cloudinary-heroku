class Article < ActiveRecord::Base
  # validation
  # 見出し
  validates :title, presence: true, length:{maximum: 32}
  validates :picture, presence: true
  validates :details, presence: true
  validates :published_at, presence: true, if: :published?

  # image_uploader(cloudinary)
  # attr_accessor :image
  mount_uploader :image, ArticleimageUploader

  # validation condition
  def published?
    self.published == true
  end

  def check_published_at
    self.published == true ? self.published_at = Time.now : self.published_at = ""
  end

  def count_pv
    REDIS.zscore("articles", self.id).floor
  end
end
