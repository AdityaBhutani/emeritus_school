# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
  let(:admin) { create(:admin) }
  let(:school_admin) { create(:school_admin) }
  let(:school) { create(:school) }
  let(:valid_attributes) { { name: 'Test School', address: '123 Test St', school_admin_id: school_admin.id } }
  let(:invalid_attributes) { { name: '', address: '', school_admin_id: nil } }

  before do
    sign_in admin # Adjust as needed if testing for other user roles
  end

  describe 'GET #index' do
    it 'assigns all schools as @schools and renders the index template' do
      school # create a school to ensure the list is not empty
      get :index
      expect(assigns(:schools)).to eq([school])
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'assigns the requested school as @school' do
      get :show, params: { id: school.to_param }
      expect(assigns(:school)).to eq(school)
    end
  end

  describe 'GET #new' do
    it 'assigns a new school as @school' do
      get :new
      expect(assigns(:school)).to be_a_new(School)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested school as @school' do
      get :edit, params: { id: school.to_param }
      expect(assigns(:school)).to eq(school)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new School' do
        expect do
          post :create, params: { school: valid_attributes }
        end.to change(School, :count).by(1)
      end

      it 'assigns a newly created school as @school and redirects to the show page' do
        post :create, params: { school: valid_attributes }
        expect(assigns(:school)).to be_a(School)
        expect(assigns(:school)).to be_persisted
        expect(response).to redirect_to(School.last)
      end
    end

    context 'with invalid params' do
      it "assigns a newly created but unsaved school as @school and re-renders the 'new' template" do
        post :create, params: { school: invalid_attributes }
        expect(assigns(:school)).to be_a_new(School)
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      let(:new_attributes) { { name: 'Updated School Name' } }

      it 'updates the requested school' do
        patch :update, params: { id: school.to_param, school: new_attributes }
        school.reload
        expect(school.name).to eq('Updated School Name')
      end

      it 'assigns the requested school as @school and redirects to the school' do
        patch :update, params: { id: school.to_param, school: new_attributes }
        expect(assigns(:school)).to eq(school)
        expect(response).to redirect_to(school)
      end
    end

    context 'with invalid params' do
      it "assigns the school as @school and re-renders the 'edit' template" do
        patch :update, params: { id: school.to_param, school: invalid_attributes }
        expect(assigns(:school)).to eq(school)
        expect(response).to render_template('edit')
      end
    end
  end
end
