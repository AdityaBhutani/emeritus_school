# frozen_string_literal: true

class Student < User
  has_many :enrollments, dependent: :destroy
  has_many :batches, through: :enrollments
end
