# Comments
class CommentsController < ApplicationController
  # before_action :set_article, only: [:create, :update]
  before_action :load_commentable, only: [:create, :update]

  def create
    # Build rest of comments
    @comment = @commentable.comments.build(comment_params)
    authorize @comment
    if @comment.save
      User.find(@commentable.author_id).comments << @comment
      redirect_to(request.referrer || root_path)
      flash[:notice] = 'Your comment will be reviewed.'
    else
      redirect_to(request.referrer || root_path)
      flash[:notice] = 'Comment could not be submitted.'
    end
  end

  def update
    @comment = @commentable.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to(request.referrer || root_path)
      flash[:notice] = 'Article was successfully updated.'
    else
      render :edit
    end
  end

  private

  def load_commentable # /projects/2  #=> resource = projects and id = 2
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def set_article
    @article = Article.find(params[:article_id]) # Obtains ID from URL
  end

  def comment_params
    params.require(:comment).permit(
      :author, :author_url, :author_email, :content, :approved)
  end
end
