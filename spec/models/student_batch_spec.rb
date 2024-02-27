# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StudentBatch, type: :model do
  context 'validations' do
    it { should validate_presence_of(:student_id) }
    it { should validate_presence_of(:batch_id) }
  end

  context 'associations' do
    it { should belong_to(:student) }
    it { should belong_to(:batch) }
  end
end
