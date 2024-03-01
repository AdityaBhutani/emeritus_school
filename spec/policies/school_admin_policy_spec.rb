# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SchoolAdminPolicy do
  subject { described_class.new(user, school_admin) }

  let(:school_admin) { create(:school_admin) }

  context 'when the user is an Admin' do
    let(:user) { create(:admin) }

    it 'permits access to index' do
      expect(subject.index?).to be_truthy
    end

    it 'permits access to show' do
      expect(subject.show?).to be_truthy
    end

    it 'permits creating a school admin' do
      expect(subject.create?).to be_truthy
    end

    it 'permits access to new' do
      expect(subject.new?).to be_truthy
    end

    it 'permits updating a school admin' do
      expect(subject.update?).to be_truthy
    end

    it 'permits access to edit' do
      expect(subject.edit?).to be_truthy
    end

    it 'permits destroying a school admin' do
      expect(subject.destroy?).to be_truthy
    end
  end

  context 'when the user is not an Admin' do
    let(:user) { create(:student) }

    it 'denies access to all actions' do
      expect(subject.index?).to be_falsey
      expect(subject.show?).to be_falsey
      expect(subject.create?).to be_falsey
      expect(subject.new?).to be_falsey
      expect(subject.update?).to be_falsey
      expect(subject.edit?).to be_falsey
      expect(subject.destroy?).to be_falsey
    end
  end
end
