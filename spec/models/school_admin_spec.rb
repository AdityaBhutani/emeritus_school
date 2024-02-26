# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SchoolAdmin, type: :model do
  it { should have_many(:schools) }
end
