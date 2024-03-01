# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BatchesController, type: :controller do
  let(:admin) { create(:admin) }
  before do
    sign_in admin
  end

  describe 'GET #index' do
    it 'assigns all batches as @batches and renders the index template' do
      batch = create(:batch)
      get :index
      expect(assigns(:batches)).to eq([batch])
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'assigns the requested batch as @batch' do
      batch = create(:batch)
      get :show, params: { id: batch.to_param }
      expect(assigns(:batch)).to eq(batch)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Batch' do
        expect do
          post :create, params: { batch: attributes_for(:batch) }
        end.to change(Batch, :count).by(1)
      end

      it 'redirects to the created batch' do
        post :create, params: { batch: attributes_for(:batch) }
        expect(response).to redirect_to(Batch.last)
      end
    end

    context 'with invalid params' do
      it "re-renders the 'new' template" do
        post :create, params: { batch: attributes_for(:batch, name: nil) }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested batch' do
      batch = create(:batch)
      expect do
        delete :destroy, params: { id: batch.to_param }
      end.to change(Batch, :count).by(-1)
    end

    it 'redirects to the batches list' do
      batch = create(:batch)
      delete :destroy, params: { id: batch.to_param }
      expect(response).to redirect_to(batches_url)
    end
  end
end
