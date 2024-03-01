require 'rails_helper'

RSpec.describe CoursePolicy do
  subject { described_class.new(user, course) }

  let(:course) { create(:course) }

  context 'when the user is an Admin' do
    let(:user) { create(:admin) }

    it 'permits access to index' do
      expect(subject.index?).to be(true)
    end

    it 'permits access to show' do
      expect(subject.show?).to be(true)
    end

    it 'permits creating a course' do
      expect(subject.create?).to be(true)
    end

    it 'permits access to new' do
      expect(subject.new?).to be(true)
    end

    it 'permits updating a course' do
      expect(subject.update?).to be(true)
    end

    it 'permits access to edit' do
      expect(subject.edit?).to be(true)
    end

    it 'permits destroying a course' do
      expect(subject.destroy?).to be(true)
    end
  end

  context 'when the user is a SchoolAdmin' do
    let(:user) { create(:school_admin) }

    it 'permits access to index' do
      expect(subject.index?).to be(true)
    end

    it 'permits access to show' do
      expect(subject.show?).to be(true)
    end

    it 'permits creating a course' do
      expect(subject.create?).to be(true)
    end

    it 'permits access to new' do
      expect(subject.new?).to be(true)
    end

    it 'permits updating a course' do
      expect(subject.update?).to be(true)
    end

    it 'permits access to edit' do
      expect(subject.edit?).to be(true)
    end

    it 'permits destroying a course' do
      expect(subject.destroy?).to be(true)
    end
  end

  context 'when the user is neither an Admin nor a SchoolAdmin' do
    let(:user) { create(:student) }

    it 'denies access to all actions' do
      expect(subject.index?).to be(false)
      expect(subject.show?).to be(false)
      expect(subject.create?).to be(false)
      expect(subject.new?).to be(false)
      expect(subject.update?).to be(false)
      expect(subject.edit?).to be(false)
      expect(subject.destroy?).to be(false)
    end
  end
end
