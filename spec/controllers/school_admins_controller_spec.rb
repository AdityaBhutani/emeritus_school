# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SchoolAdminsController, type: :controller do
  let(:admin) { create(:admin) }
  let(:school_admin) { create(:school_admin) }
  let(:valid_attributes) do
    { first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', password: 'password' }
  end
  let(:invalid_attributes) { { first_name: '', last_name: '', email: 'invalid_email', password: 'short' } }

  before do
    sign_in admin
  end

  describe 'GET #index' do
    it 'assigns all school_admins as @school_admins and renders the index template' do
      get :index
      expect(assigns(:school_admins)).to eq([school_admin])
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'assigns the requested school_admin as @school_admin' do
      get :show, params: { id: school_admin.to_param }
      expect(assigns(:school_admin)).to eq(school_admin)
    end
  end

  describe 'GET #new' do
    it 'assigns a new school_admin as @school_admin' do
      get :new
      expect(assigns(:school_admin)).to be_a_new(SchoolAdmin)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested school_admin as @school_admin' do
      get :edit, params: { id: school_admin.to_param }
      expect(assigns(:school_admin)).to eq(school_admin)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new SchoolAdmin' do
        expect do
          post :create, params: { school_admin: valid_attributes }
        end.to change(SchoolAdmin, :count).by(1)
      end

      it 'assigns a newly created school_admin as @school_admin and redirects to the show page' do
        post :create, params: { school_admin: valid_attributes }
        expect(assigns(:school_admin)).to be_a(SchoolAdmin)
        expect(assigns(:school_admin)).to be_persisted
        expect(response).to redirect_to(SchoolAdmin.last)
      end
    end

    context 'with invalid params' do
      it "assigns a newly created but unsaved school_admin as @school_admin and re-renders the 'new' template" do
        post :create, params: { school_admin: invalid_attributes }
        expect(assigns(:school_admin)).to be_a_new(SchoolAdmin)
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      let(:new_attributes) { { first_name: 'Jane' } }

      it 'updates the requested school_admin' do
        patch :update, params: { id: school_admin.to_param, school_admin: new_attributes }
        school_admin.reload
        expect(school_admin.first_name).to eq('Jane')
      end

      it 'assigns the requested school_admin as @school_admin and redirects to the school_admin' do
        patch :update, params: { id: school_admin.to_param, school_admin: new_attributes }
        expect(assigns(:school_admin)).to eq(school_admin)
        expect(response).to redirect_to(school_admin)
      end
    end

    context 'with invalid params' do
      it "assigns the school_admin as @school_admin and re-renders the 'edit' template" do
        patch :update, params: { id: school_admin.to_param, school_admin: invalid_attributes }
        expect(assigns(:school_admin)).to eq(school_admin)
        expect(response).to render_template('edit')
      end
    end
  end
end
