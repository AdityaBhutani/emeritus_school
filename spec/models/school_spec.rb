# frozen_string_literal: true

require 'rails_helper'

RSpec.describe School, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
  end

  context 'associations' do
    it { should belong_to(:school_admin) }
    it { should have_many(:courses).dependent(:destroy) }
  end
end
