# frozen_string_literal: true

class Student < User
  has_many :student_batches
  has_many :batches, through: :student_batches
end
