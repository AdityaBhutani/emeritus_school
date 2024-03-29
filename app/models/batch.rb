# frozen_string_literal: true

class Batch < ApplicationRecord
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :course
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments, source: :student
end
