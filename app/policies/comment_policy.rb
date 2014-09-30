class CommentPolicy < ApplicationPolicy
  def permitted_attributes
    if user.editor? || user.author?
      [:approved]
    end
  end

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
