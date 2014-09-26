class ArticlePolicy
  attr_reader :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def publish?
    @user.role == "editor"
  end
end
