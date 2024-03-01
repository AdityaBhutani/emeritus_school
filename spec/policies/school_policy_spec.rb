require 'rails_helper'

RSpec.describe SchoolPolicy do
  let(:school) { create(:school) }

  context 'when the user is an Admin' do
    let(:user) { create(:admin) }
    let(:policy) { described_class.new(user, school) }

    it 'permits access to index' do
      expect(policy.index?).to be(true)
    end

    it 'permits access to show' do
      expect(policy.show?).to be(true)
    end

    it 'permits creating a school' do
      expect(policy.create?).to be(true)
    end

    it 'permits access to new' do
      expect(policy.new?).to be(true)
    end

    it 'permits updating a school' do
      expect(policy.update?).to be(true)
    end

    it 'permits access to edit' do
      expect(policy.edit?).to be(true)
    end

    it 'permits destroying a school' do
      expect(policy.destroy?).to be(true)
    end
  end

  context 'when the user is a SchoolAdmin' do
    let(:user) { create(:school_admin) }
    let(:policy) { described_class.new(user, school) }

    before do
      school.school_admin = user
    end

    it 'denies access to index' do
      expect(policy.index?).to be(false)
    end

    it 'permits access to show if the school admin matches' do
      expect(policy.show?).to be(true)
    end

    it 'denies creating a school' do
      expect(policy.create?).to be(false)
    end

    it 'denies access to new' do
      expect(policy.new?).to be(false)
    end

    it 'permits updating a school if the school admin matches' do
      expect(policy.update?).to be(true)
    end

    it 'permits access to edit if the school admin matches' do
      expect(policy.edit?).to be(true)
    end

    it 'denies destroying a school' do
      expect(policy.destroy?).to be(false)
    end
  end

  context 'when the user is neither an Admin nor a SchoolAdmin' do
    let(:user) { create(:student) }
    let(:policy) { described_class.new(user, school) }

    it 'denies access to all actions' do
      expect(policy.index?).to be(false)
      expect(policy.show?).to be(false)
      expect(policy.create?).to be(false)
      expect(policy.new?).to be(false)
      expect(policy.update?).to be(false)
      expect(policy.edit?).to be(false)
      expect(policy.destroy?).to be(false)
    end
  end
end
