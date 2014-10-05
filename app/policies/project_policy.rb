# Policy for projects
class ProjectPolicy < ApplicationPolicy
  # Scope controls the data that can be displayed to specific user roles in
  # the views. This scope inherits from the scope in ApplicationPolicy::Scope
  class Scope < Scope
    def resolve
      if user.editor?
        scope.all
      elsif user.author?
        scope.where author_id: user.id
      else
        scope.where published: true
      end
    end
  end
end
