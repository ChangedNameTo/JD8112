class UserRolePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.has_role?(Role.where(label: 'System Admin'))
  end

  def show?
    index?
  end

  def create?
    index?
  end

  def update?
    user.has_role?(Role.where(label: ['System Admin', 'Expo Admin']))
  end

  def destroy?
    index?
  end

  def bookmark?
    !user.has_role?(Role.where(label: ['System Admin', 'Expo Admin', 'Team Member']))
  end

end
