# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SchoolAdmin, type: :model do
  context 'associations' do
    it { should have_many(:schools).dependent(:destroy) }
  end
end
