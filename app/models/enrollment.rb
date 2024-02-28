class Enrollment < ApplicationRecord
  enum status: { pending: 0, approved: 1, denied: 2 }

  validates :student_id, presence: true
  validates :batch_id, presence: true
  validates :status, presence: true

  belongs_to :student
  belongs_to :batch
end
