class SchoolPolicy < ApplicationPolicy
  def index?
    user.is_a?(Admin)
  end

  def show?
    user.is_a?(Admin) || (user.is_a?(SchoolAdmin) && record.school_admin == user)
  end

  def create?
    user.is_a?(Admin)
  end

  def new?
    user.is_a?(Admin)
  end

  def update?
    user.is_a?(Admin) || (user.is_a?(SchoolAdmin) && record.school_admin == user)
  end

  def edit?
    update?
  end

  def destroy?
    user.is_a?(Admin)
  end
end
