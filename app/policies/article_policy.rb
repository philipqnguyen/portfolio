# Policies for articles
class ArticlePolicy < ApplicationPolicy
  def permitted_attributes
    if user.editor?
      [:published, :title, :body]
    elsif user.author?
      [:title, :body]
    end
  end

  def update?
    user.id == record.author_id || user.editor? if user
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

  def author_page?
    user.author? || user.editor? if user
  end

  # Scope controls the data that can be displayed to specific user roles in
  # the views. This scope inherits from the scope in ApplicationPolicy::Scope
  class Scope < Scope
    def resolve
      if user
        scope.all
      else
        scope.where published: true
      end
    end
  end
end
