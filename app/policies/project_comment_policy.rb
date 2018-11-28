class ProjectCommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def update?
    user.has_role?(Role.where(label: ['System Admin', 'Expo Admin'])) or record == user
  end

  def create?
    true
  end

  def destroy?
    create?
  end
end
