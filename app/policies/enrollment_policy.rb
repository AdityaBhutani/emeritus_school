class EnrollmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.is_a?(Student)
        Enrollment.where(student_id: user.id)
      else
        scope.all
      end
    end
  end

  def index?
    user.is_a?(Admin) || user.is_a?(SchoolAdmin) || user.is_a?(Student)
  end

  def show?
    user.is_a?(Admin) || user.is_a?(SchoolAdmin) || (user.is_a?(Student) && record.student.id == user.id)
  end

  def create?
    user.is_a?(Admin) || user.is_a?(SchoolAdmin) || user.is_a?(Student)
  end

  def new?
    user.is_a?(Admin) || user.is_a?(SchoolAdmin) || user.is_a?(Student)
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
