class BookmarkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    !user.has_role?(Role.where(label: ['System Admin', 'Expo Admin', 'Team Member']))
  end

  def show?
    index?
  end

  def create?
    index?
  end

  def update?
    index?
  end

  def destroy?
    index?
  end

  def bookmark?
    index?
  end
end