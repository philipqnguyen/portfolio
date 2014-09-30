class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    # authorize @comment

    if @comment.save
      redirect_to(request.referrer || root_path)
      flash[:notice] = 'Your comment will be reviewed.'
    else
      redirect_to(request.referrer || root_path)
      flash[:notice] = 'Comment could not be submitted.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :author, :author_url, :author_email, :content)
  end
end
