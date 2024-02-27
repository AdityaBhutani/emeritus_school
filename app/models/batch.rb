# frozen_string_literal: true

class Batch < ApplicationRecord
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :course
  has_many :student_batches
  has_many :students, through: :student_batches, source: :user, source_type: 'Student'
end
