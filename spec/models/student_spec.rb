# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student, type: :model do
  context 'associations' do
    it { should have_many(:enrollments).dependent(:destroy) }
    it { should have_many(:batches).through(:enrollments) }
  end
end
