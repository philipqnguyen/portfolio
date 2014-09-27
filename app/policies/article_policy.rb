class ArticlePolicy < ApplicationPolicy
  def permitted_attributes
    if user.editor?
      [:published, :title, :body]
    elsif user.author?
      [:title, :body]
    end
  end

  def update?
    user.author? || user.editor? if user
  end

  def create?
    user.author? || user.editor? if user
  end

  def destroy?
    user.editor? if user
  end

  def publish?
    user.editor? if user
  end

  def show?
    user.author? || user.editor? if user
  end

  class Scope < Scope
    def resolve
      if user
        scope.all
      else
        scope.where published: true
      end
    end

    def find
      if user
        scope.find(params[:id])
      else
        article = scope.find(params[:id])
        article if article.published?
        raise Pundit::NotAuthorizedError, "must be logged in" unless user
      end
    end
  end
end
