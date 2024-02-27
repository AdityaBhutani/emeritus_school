# frozen_string_literal: true

class SchoolAdmin < User
  has_many :schools, dependent: :destroy
end
