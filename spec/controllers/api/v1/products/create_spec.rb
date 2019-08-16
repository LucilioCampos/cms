require 'rails_helper'

describe Api::V1::ProductsController, type: :request do
  
  context 'When create a product' do
    
    before :all do
      @product = build(:product)

      post "/api/v1/products", params: @product.attributes
    end

    it 'returns a HTTP status 200' do
      expect(response).to have_http_status 201
    end

    it 'returns a resources size' do
      expect(JSON.parse(response.body).size).to eq 5
    end

    it 'returns a new kind_id' do
      expect(JSON.parse(response.body)['kind_id']).to eq @product.kind_id
    end

    it 'returns a new description' do
      expect(JSON.parse(response.body)['description']).to eq @product.description
    end

    it 'returns a new status' do
      expect(JSON.parse(response.body)['status']).to eq @product.status
    end

  end
end