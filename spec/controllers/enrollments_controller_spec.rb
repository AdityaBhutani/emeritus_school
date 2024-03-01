# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EnrollmentsController, type: :controller do
  let(:student) { create(:student) }
  let(:admin) { create(:admin) }
  let(:enrollment) { create(:enrollment) }
  let(:valid_attributes) { { batch_id: create(:batch).id, student_id: student.id, status: 'pending' } }
  let(:invalid_attributes) { { batch_id: nil, student_id: nil, status: nil } }

  describe 'GET #index' do
    context 'as an admin' do
      before { sign_in admin }

      it 'assigns all enrollments as @enrollments' do
        get :index
        expect(assigns(:enrollments)).to eq([enrollment])
        expect(response).to be_successful
      end
    end
  end

  describe 'GET #show' do
    context 'as an admin' do
      before { sign_in admin }

      it 'assigns the requested enrollment as @enrollment' do
        get :show, params: { id: enrollment.to_param }
        expect(assigns(:enrollment)).to eq(enrollment)
      end
    end
  end

  describe 'GET #new' do
    context 'as an admin' do
      before { sign_in admin }

      it 'assigns a new enrollment as @enrollment' do
        get :new
        expect(assigns(:enrollment)).to be_a_new(Enrollment)
      end
    end
  end

  describe 'GET #edit' do
    context 'as an admin' do
      before { sign_in admin }

      it 'assigns the requested enrollment as @enrollment' do
        get :edit, params: { id: enrollment.to_param }
        expect(assigns(:enrollment)).to eq(enrollment)
      end
    end
  end

  describe 'POST #create' do
    context 'as an admin' do
      before { sign_in admin }

      context 'with valid params' do
        it 'creates a new Enrollment' do
          expect do
            post :create, params: { enrollment: valid_attributes }
          end.to change(Enrollment, :count).by(1)
        end

        it 'redirects to the created enrollment' do
          post :create, params: { enrollment: valid_attributes }
          expect(response).to redirect_to(Enrollment.last)
        end
      end

      context 'with invalid params' do
        it "re-renders the 'new' template" do
          post :create, params: { enrollment: invalid_attributes }
          expect(response).to render_template('new')
        end
      end
    end
  end

  describe 'PATCH #update' do
    context 'as an admin' do
      before { sign_in admin }

      context 'with valid params' do
        let(:new_attributes) { { status: 'approved' } }

        it 'updates the requested enrollment' do
          patch :update, params: { id: enrollment.to_param, enrollment: new_attributes }
          enrollment.reload
          expect(enrollment.status).to eq('approved')
        end

        it 'redirects to the enrollment' do
          patch :update, params: { id: enrollment.to_param, enrollment: new_attributes }
          expect(response).to redirect_to(enrollment)
        end
      end

      context 'with invalid params' do
        it "re-renders the 'edit' template" do
          patch :update, params: { id: enrollment.to_param, enrollment: invalid_attributes }
          expect(response).to render_template('edit')
        end
      end
    end
  end
end
