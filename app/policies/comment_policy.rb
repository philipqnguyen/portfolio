# Comment
class CommentPolicy < ApplicationPolicy
  def permitted_attributes
    [:approved] if user.editor? || user.author?
  end

  def create?
    user.editor? || user.author? || user.visitor?
  end

  # Scope controls the data that can be displayed to specific user roles in
  # the views. This scope inherits from the scope in ApplicationPolicy::Scope
  class Scope < Scope
    def resolve
      if user.editor?
        scope.all
      elsif user.author?
        scope.where author_id: user.id
      else
        scope.where approved: true
      end
    end
  end
end
