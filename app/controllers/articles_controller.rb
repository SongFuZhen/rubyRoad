class ArticlesController < ApplicationController
  # 此处为身份认证机制。除了index和show两个动作，其他动作都要通过验证。
  http_basic_authenticate_with name: 'dhh', password: 'secret', except: [:index, :show]

  # Create Article page
  def new
    @article = Article.new
  end

  # Create Article
  def create
    @article = Article.new(params[:article])

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  # Show Article if Create success
  def show
    @article = Article.find(params[:id])
  end

  # Show All Articles
  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  # 不用更新所有属性 使用@article.update(title:'A new Title')只更新title属性
  def update
    @article=Article.find(params[:id])

    if @article.update(params[:article])
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article=Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end
end
