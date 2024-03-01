require 'rails_helper'

RSpec.describe BatchPolicy do
  subject { described_class.new(user, batch) }

  let(:batch) { create(:batch) } 

  context 'when the user is an Admin' do
    let(:user) { create(:admin) } 

    it 'allows access to index' do
      expect(subject.index?).to eq(true)
    end

    it 'allows access to show' do
      expect(subject.show?).to eq(true)
    end

    it 'allows creating a batch' do
      expect(subject.create?).to eq(true)
    end

    it 'allows access to new' do
      expect(subject.new?).to eq(true)
    end

    it 'allows updating a batch' do
      expect(subject.update?).to eq(true)
    end

    it 'allows access to edit' do
      expect(subject.edit?).to eq(true)
    end

    it 'allows destroying a batch' do
      expect(subject.destroy?).to eq(true)
    end
  end

  context 'when the user is a SchoolAdmin' do
    let(:user) { create(:school_admin) } 

    it 'allows access to index' do
      expect(subject.index?).to eq(true)
    end

    it 'allows access to show' do
      expect(subject.show?).to eq(true)
    end

    it 'allows creating a batch' do
      expect(subject.create?).to eq(true)
    end

    it 'allows access to new' do
      expect(subject.new?).to eq(true)
    end

    it 'allows updating a batch' do
      expect(subject.update?).to eq(true)
    end

    it 'allows access to edit' do
      expect(subject.edit?).to eq(true)
    end

    it 'allows destroying a batch' do
      expect(subject.destroy?).to eq(true)
    end
  end

  context 'when the user is neither an Admin nor a SchoolAdmin' do
    let(:user) { create(:student) } 

    it 'denies access to all actions' do
      expect(subject.index?).to eq(false)
      expect(subject.show?).to eq(false)
      expect(subject.create?).to eq(false)
      expect(subject.new?).to eq(false)
      expect(subject.update?).to eq(false)
      expect(subject.edit?).to eq(false)
      expect(subject.destroy?).to eq(false)
    end
  end
end
