class ProjectVotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true
  end

  def update?
    true
  end

  def create?
    !user.has_role?(Role.where(label: ['System Admin', 'Expo Admin', 'Team Member']))
  end

  def destroy?
    create?
  end
end
