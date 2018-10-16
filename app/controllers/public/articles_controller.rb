class Public::ArticlesController < Public::PublicBase
  def index
    @articles = Article.all.reverse_order
    ids = REDIS.zrevrangebyscore "articles", "+inf", 0, limit:[0, 2]
    @top3_rankings = ids.map{|id| Article.find(id)}
    binding.pry
  end

  def show
    @article = Article.find(params[:id])
    REDIS.zincrby "articles", 1, @article.id
    # redirect_to public_articles_path
  end

  def add_pv
    @article = Article.find(params[:id])
    REDIS.zincrby "articles", 1, @article.id
    redirect_to public_articles_path
  end
end
