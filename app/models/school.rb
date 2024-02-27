# frozen_string_literal: true

class School < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true

  belongs_to :school_admin
  has_many :courses
end
