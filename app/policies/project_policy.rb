class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true
  end

  def index?
    true
  end

  def update?
    user.has_role?(Role.where(label: ['System Admin', 'Expo Admin'])) or record == user
  end

  def create?
    user.has_role?(Role.where(label: ['System Admin', 'Expo Admin']))
  end

  def destroy?
    create?
  end

  def bookmark?
    !user.has_role?(Role.where(label: ['System Admin', 'Expo Admin', 'Team Member']))
  end

  def vote?
    !user.has_role?(Role.where(label: ['System Admin', 'Expo Admin', 'Team Member']))
  end

  def voting_pdf?
    true
  end
end
