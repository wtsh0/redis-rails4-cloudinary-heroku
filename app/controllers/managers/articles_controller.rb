class Managers::ArticlesController < Managers::ManagersBase
  before_action :set_article, except: [:index, :new, :create]

  def index
    @articles = Article.all.reverse_order
  end

  def show
  end

  def new
    @article = Article.new
    @submit = "登録する"
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      redirect_to root_path, success: "#{@article.title}が登録されました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to root_path, success: "#{@article.tile}が更新されました"
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path, success: "#{@article.title}を削除しました"
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.permit(:article).permit(:title, :details, :published, :published_at, :week_pv, :monthly_pv, :total_pv)
    end
end
