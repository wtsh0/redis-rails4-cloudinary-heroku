class Article < ActiveRecord::Base
  # validation
  # 見出し
  validates :title, presence: true, length:{maximum: 32}
  validates :picture, presence: true
  validates :details, presence: true
  # validates :published_at, presence: true, if: :published?

  # image_uploader(cloudinary)
  attr_accessor :picture
  mount_uploader :picture, ArticleimageUploader

  # validation condition
  def published?
    self.published == true
  end

  def check_published_at
    if self.published == true
      self.published_at = Time.now
    else
      if !self.published_at.blank?
        self.published_at = nil
        # binding.pry
      end
    end
    # binding.pry
  end

  def count_pv
    REDIS.zscore("articles", self.id).floor
  end
end
