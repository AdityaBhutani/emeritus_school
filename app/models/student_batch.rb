# frozen_string_literal: true

class StudentBatch < ApplicationRecord
  belongs_to :student
  belongs_to :batch
end