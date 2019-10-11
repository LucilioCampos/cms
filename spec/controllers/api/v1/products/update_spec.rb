require 'rails_helper'

describe Api::V1::ProductsController, type: :request do
  
  context 'When update a product' do
    
    before :all do
      @old = create(:product)
      @new = build(:product)
      put "/api/v1/products/#{@old.id}", params: @new.attributes
    end

    it 'returns HTTP response 202' do
      expect(response).to have_http_status 202
    end

    it 'returns a resources size' do
      expect(JSON.parse(response.body).size).to eq 5
    end

    it 'returns a new kind' do
      expect(JSON.parse(response.body)['kind_id']).to eq @new.kind_id
    end

    it 'returns a new description' do
      expect(JSON.parse(response.body)['description']).to eq @new.description
    end

    it 'returns a new status' do
      expect(JSON.parse(response.body)['status']).to eq @new.status
    end

    it 'returns a new price' do
      expect(JSON.parse(response.body)['price']).to eq @new.price
    end
  end
end