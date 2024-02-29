# frozen_string_literal: true

class Student < User
  has_many :enrollments, dependent: :destroy
  has_many :batches, through: :enrollments

  def classmates
    Student.joins(:enrollments).where(enrollments: { batch_id: batches.pluck(:id) }).where.not(id: id).distinct
  end
end
