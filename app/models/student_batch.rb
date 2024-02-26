# frozen_string_literal: true

class StudentBatch < ApplicationRecord
  belongs_to :student, class_name: 'Student'
  belongs_to :batch
end
