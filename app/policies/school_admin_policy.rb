class SchoolAdminPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    user.is_a?(Admin)
  end

  def show?
    user.is_a?(Admin)
  end

  def create?
    user.is_a?(Admin)
  end

  def new?
    user.is_a?(Admin)
  end

  def update?
    user.is_a?(Admin)
  end

  def edit?
    update?
  end

  def destroy?
    user.is_a?(Admin)
  end
end
