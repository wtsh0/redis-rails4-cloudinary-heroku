class Article < ActiveRecord::Base

  def check_published_at
    self.published_at = Time.now if self.published == true
  end
end
