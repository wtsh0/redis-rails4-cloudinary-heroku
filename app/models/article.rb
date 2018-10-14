class Article < ActiveRecord::Base

  def check_published_at
    self.published == true ? self.published_at = Time.now : self.published_at = ""
  end
end
