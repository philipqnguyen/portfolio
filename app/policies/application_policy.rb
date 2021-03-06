# Default parent policy. Other policies will inherit from this class.
class ApplicationPolicy
  attr_reader :user, :record

  # Used in place for empty user
  class NilUser
    def editor?
      false
    end

    def author?
      false
    end

    def visitor?
      false
    end

    def id
      false
    end
  end

  def initialize(user, record)
    if user
      @user = user
    else
      @user = NilUser.new
    end
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  # Parent scope. Other scopes will inherit from this. Scope controls the data
  # that can be displayed to specific user roles in the view.
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      if user
        @user = user
      else
        @user = NilUser.new
      end
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
