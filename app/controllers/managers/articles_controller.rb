class Managers::ArticlesController < Managers::ManagersBase
  before_action :set_article, except: [:index, :new, :create]

  def index
    @articles = Article.all.reverse_order
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @submit = "登録する"
  end

  def create
    @article = Article.create(article_params)
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
      redirect_to managers_articles_path, success: "#{@article.title}が更新されました"
    else
      @submit = "変更する"
      render "edit"
    end
  end

  def destroy
    @article.destroy
    redirect_to managers_articles_path, success: "#{@article.title}を削除しました"
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :image, :details, :published, :published_at, :week_pv, :monthly_pv, :total_pv)
    end
end
