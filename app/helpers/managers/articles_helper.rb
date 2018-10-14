module Managers::ArticlesHelper
  def article_status(status)
    status == true ? "公開中" : "未公開"
  end
  
  def check_published_at(time)
    time != nil ? "#{time.to_s(:time_short)}" : "ー"
  end
end
