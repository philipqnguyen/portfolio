# Comments
class CommentsController < ApplicationController
  before_action :set_article, only: [:create, :update]

  def create
    @comment = @article.comments.build(comment_params) # Build rest of comments
    authorize @comment
    if @comment.save
      User.find(@article.author_id).comments << @comment
      redirect_to(request.referrer || root_path)
      flash[:notice] = 'Your comment will be reviewed.'
    else
      redirect_to(request.referrer || root_path)
      flash[:notice] = 'Comment could not be submitted.'
    end
  end

  def update
    @comment = @article.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to(request.referrer || root_path)
      flash[:notice] = 'Article was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id]) # Obtains ID from URL
  end

  def comment_params
    params.require(:comment).permit(
      :author, :author_url, :author_email, :content, :approved)
  end
end
