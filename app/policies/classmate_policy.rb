class ClassmatePolicy < ApplicationPolicy
  def index?
    user.is_a?(Student)
  end
end
