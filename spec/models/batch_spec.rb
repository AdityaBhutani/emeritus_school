# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Batch, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
  end

  context 'associations' do
    it { should belong_to(:course) }
    it { should have_many(:enrollments).dependent(:destroy) }
  end
end
