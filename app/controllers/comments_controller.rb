# Comments
class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id]) # Obtains ID from URL

    # Builds the rest of the comments with the form data.
    @comment = @article.comments.build(comment_params)

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
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to(request.referrer || root_path)
      flash[:notice] = 'Article was successfully updated.'
    else
      render :edit
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :author, :author_url, :author_email, :content, :approved)
  end
end
