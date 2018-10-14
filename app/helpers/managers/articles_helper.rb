module Managers::ArticlesHelper
  def article_status(status)
    status == true ? "公開中" : "未公開"
  end
end
