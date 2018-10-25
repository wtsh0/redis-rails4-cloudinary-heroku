class Managers::ArticlesController < Managers::ManagersBase
  before_action :set_article,  only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all.reverse_order
  end

  def new
    @article = Article.new
    @submit = "登録する"
  end

  def create
    # @article.check_published_at
    @article = Article.new(article_params)
    @article.check_published_at
    if @article.save
      redirect_to managers_articles_path, success: "#{@article.title}が登録されました"
    else
      @submit = "登録する"
      render 'new'
    end
  end

  def edit
    @submit = "変更する"
  end

  def update
    @article.check_published_at
    # binding.pry
    if @article.update(article_params)
    # if @article.save
      # binding.pry
      redirect_to managers_articles_path, success: "#{@article.title}が更新されました"
    else
      @submit = "変更する"
      render "edit"
    end
  end

  def destroy
    @article.destroy
    # REDIS.zincrby "articles", 1, @article.id
    REDIS.zrem "articles", @article.id
    redirect_to managers_articles_path, success: "#{@article.title}を削除しました"
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :picture, :details, :published, :published_at, :week_pv, :monthly_pv, :total_pv)
    end
end
