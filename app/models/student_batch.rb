# frozen_string_literal: true

class StudentBatch < ApplicationRecord
  validates :student_id, presence: true
  validates :batch_id, presence: true
  validates :student_id, uniqueness: { scope: :batch_id }

  belongs_to :student, class_name: 'Student'
  belongs_to :batch
end
