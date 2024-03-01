class BatchPolicy < ApplicationPolicy
  def index?
    user.is_a?(Admin) || user.is_a?(SchoolAdmin)
  end

  def show?
    user.is_a?(Admin) || user.is_a?(SchoolAdmin)
  end

  def create?
    user.is_a?(Admin) || user.is_a?(SchoolAdmin)
  end

  def new?
    user.is_a?(Admin) || user.is_a?(SchoolAdmin)
  end

  def update?
    user.is_a?(Admin) || user.is_a?(SchoolAdmin)
  end

  def edit?
    update?
  end

  def destroy?
    user.is_a?(Admin) || user.is_a?(SchoolAdmin)
  end
end
