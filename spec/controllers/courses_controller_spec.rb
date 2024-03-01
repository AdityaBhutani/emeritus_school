# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:admin) { create(:admin) }
  let(:school) { create(:school) }
  let(:valid_attributes) { { name: 'New Course', description: 'Course Description', school_id: school.id } }
  let(:invalid_attributes) { { name: '', description: '', school_id: nil } }

  before do
    sign_in admin
  end

  describe 'GET #index' do
    it 'assigns all courses as @courses and renders the index template' do
      course = Course.create! valid_attributes
      get :index
      expect(assigns(:courses)).to eq([course])
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'assigns the requested course as @course' do
      course = Course.create! valid_attributes
      get :show, params: { id: course.to_param }
      expect(assigns(:course)).to eq(course)
    end
  end

  describe 'GET #new' do
    it 'assigns a new course as @course' do
      get :new
      expect(assigns(:course)).to be_a_new(Course)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested course as @course' do
      course = Course.create! valid_attributes
      get :edit, params: { id: course.to_param }
      expect(assigns(:course)).to eq(course)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Course' do
        expect do
          post :create, params: { course: valid_attributes }
        end.to change(Course, :count).by(1)
      end

      it 'assigns a newly created course as @course and redirects to the course' do
        post :create, params: { course: valid_attributes }
        expect(assigns(:course)).to be_a(Course)
        expect(assigns(:course)).to be_persisted
        expect(response).to redirect_to(Course.last)
      end
    end

    context 'with invalid params' do
      it "assigns a newly created but unsaved course as @course and re-renders the 'new' template" do
        post :create, params: { course: invalid_attributes }
        expect(assigns(:course)).to be_a_new(Course)
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { name: 'Updated Course Name' } }

      it 'updates the requested course' do
        course = Course.create! valid_attributes
        put :update, params: { id: course.to_param, course: new_attributes }
        course.reload
        expect(course.name).to eq('Updated Course Name')
      end

      it 'assigns the requested course as @course and redirects to the course' do
        course = Course.create! valid_attributes
        put :update, params: { id: course.to_param, course: new_attributes }
        expect(assigns(:course)).to eq(course)
        expect(response).to redirect_to(course)
      end
    end

    context 'with invalid params' do
      it "assigns the course as @course and re-renders the 'edit' template" do
        course = Course.create! valid_attributes
        put :update, params: { id: course.to_param, course: invalid_attributes }
        expect(assigns(:course)).to eq(course)
        expect(response).to render_template('edit')
      end
    end
  end
end
