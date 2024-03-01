# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EnrollmentPolicy do
  let(:enrollment) { create(:enrollment) }
  let(:resolved_scope) { EnrollmentPolicy::Scope.new(user, Enrollment.all).resolve }

  shared_examples 'access granted' do
    it 'grants access to index' do
      expect(subject.index?).to be true
    end

    it 'grants access to show' do
      expect(subject.show?).to be true
    end

    it 'grants access to create' do
      expect(subject.create?).to be true
    end

    it 'grants access to new' do
      expect(subject.new?).to be true
    end

    it 'grants access to update' do
      expect(subject.update?).to be true
    end

    it 'grants access to edit' do
      expect(subject.edit?).to be true
    end

    it 'grants access to destroy' do
      expect(subject.destroy?).to be true
    end
  end

  context 'when the user is an Admin' do
    let(:user) { create(:admin) }
    subject { described_class.new(user, enrollment) }

    it_behaves_like 'access granted'
  end

  context 'when the user is a SchoolAdmin' do
    let(:user) { create(:school_admin) }
    subject { described_class.new(user, enrollment) }

    it_behaves_like 'access granted'
  end

  context 'when the user is a Student' do
    let(:user) { create(:student) }
    subject { described_class.new(user, enrollment) }

    it 'grants access to index' do
      expect(subject.index?).to be true
    end

    it 'conditionally grants access to show based on the enrollment student' do
      enrollment.student = user
      expect(subject.show?).to be true
      enrollment.student = create(:student) # Different student
      expect(subject.show?).to be false
    end

    it 'grants access to create' do
      expect(subject.create?).to be true
    end

    it 'grants access to new' do
      expect(subject.new?).to be true
    end

    it 'denies access to update' do
      expect(subject.update?).to be false
    end

    it 'denies access to edit' do
      expect(subject.edit?).to be false
    end

    it 'denies access to destroy' do
      expect(subject.destroy?).to be false
    end

    describe 'Scope' do
      context 'when user is a Student' do
        let(:user) { create(:student) }
        it 'includes only enrollments of the student' do
          own_enrollment = create(:enrollment, student: user)
          create(:enrollment) # Enrollment for another student
          expect(resolved_scope).to include(own_enrollment)
          expect(resolved_scope.count).to eq(1)
        end
      end

      context 'when user is an Admin' do
        let(:user) { create(:admin) }
        it 'includes all enrollments' do
          expect(resolved_scope.count).to eq(Enrollment.count)
        end
      end
    end
  end
end
