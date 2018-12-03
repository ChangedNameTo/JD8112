class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    destroy?
  end

  def show?
    destroy?
  end

  def create?
    destroy?
  end

  def update?
    destroy?
  end

  def destroy?
    user.has_role?(Role.where(label: ['System Admin']))
  end

  def destroy_all?
    destroy?
  end
end
