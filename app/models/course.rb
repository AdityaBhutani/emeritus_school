# frozen_string_literal: true

class Course < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :school
  has_many :batches
end
