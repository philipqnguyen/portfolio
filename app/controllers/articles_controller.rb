# Controls the data flow between the articles view and the article.rb model
class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /articles
  # GET /articles.json
  def index
    @articles = policy_scope(Article)
  end

  def author_page
    @articles = policy_scope(Article)
    authorize @articles

    @article = Article
    @comments = policy_scope(Comment)
    @projects = policy_scope(Project)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    authorize @article unless @article.published
    @commentable = @article
    @comment = @commentable.comments.build # builds a comment w/ article_id
    @comments = policy_scope(@article.comments)
  end

  # GET /articles/new
  def new
    @article = Article.new
    @remote_value = true
  end

  # GET /articles/1/edit
  def edit
    authorize @article
    @remote_value = false
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    authorize @article

    save @article
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    authorize @article
    if @article.update(article_params)
      message = 'Article was successfully updated.'
      respond_to do |format|
        format.html { redirect_to @article, notice: message}
        format.js
      end
    else
      render :edit
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    authorize @article
    @article.destroy
    message = 'Article was successfully destroyed.'

    respond_to do |format|
      format.html { redirect_to articles_path, notice: message}
      format.js
    end
  end

  private

  def save(article)
    if article.save
      message = 'Article was successfully created.'
      current_user.articles << article
      respond_to do |format|
        format.html { redirect_to article, notice: message}
        format.js
      end
    else
      render :new
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def article_params
    params.require(:article).permit(
      *policy(@article || Article).permitted_attributes)
  end
end
