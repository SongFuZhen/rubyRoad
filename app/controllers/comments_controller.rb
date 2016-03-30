class CommentsController < ApplicationController
  # 只有通过认证的用户才可以删除评论
  http_basic_authenticate_with name: 'dhh', password: 'secret', only: :destroy

  # 定义create方法
  def create
    @article =Article.find(params[:article_id])
    @comment=@article.comments.create(params[:comment])
    redirect_to articles_path(@article)
  end

  def destroy
    @article=Article.find(params[:article_id])
    @comment=@article.comments.find(params[:id])
    @comment.destroy

    # 删除成功之后转向显示文章的界面
    redirect_to articles_path(@article)
  end
end
