class Public::ArticlesController < Public::PublicBase

  def index
    @articles = Article.all.reverse_order
  end

  def show
    @article = Article.find(params[:id])
  end

  def add_pv
    
  end
end
