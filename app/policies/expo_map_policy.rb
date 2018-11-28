class ExpoMapPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def show?
    index?
  end

  def create?
    user.has_role?(Role.where(label: ['System Admin', 'Expo Admin']))
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end