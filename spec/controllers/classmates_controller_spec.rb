# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClassmatesController, type: :controller do
  let!(:student) { create(:student) }
  let!(:batch) { create(:batch) }
  let!(:enrollment) { create(:enrollment, student: student, batch: batch) }

  let!(:classmate1) { create(:student) }
  let!(:enrollment1) { create(:enrollment, student: classmate1, batch: batch) }

  let!(:classmate2) { create(:student) }
  let!(:enrollment2) { create(:enrollment, student: classmate2, batch: batch) }

  let!(:classmate3) { create(:student) }
  let!(:enrollment3) { create(:enrollment, student: classmate3, batch: batch) }

  let(:classmates) { [classmate1, classmate2, classmate3] }

  before do
    sign_in student

    allow(student).to receive(:classmates).and_return(classmates)
  end

  describe 'GET #index' do
    it 'assigns @classmates' do
      get :index
      expect(assigns(:student)).to eq(student)
      expect(assigns(:classmates)).to match_array(classmates)
    end
  end
end
