# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student, type: :model do
  context 'associations' do
    it { should have_many(:student_batches).dependent(:destroy) }
    it { should have_many(:batches).through(:student_batches) }
  end
end
