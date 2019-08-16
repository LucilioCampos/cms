require 'rails_helper'

describe Api::V1::ProductsController, type: :request do
  
  context 'When get a list of products' do
    
    before :all do
      create_list(:product, 10)
      get '/api/v1/products'
    end

    it 'returns HTTP response 200' do
      expect(response).to have_http_status 200
    end

    it 'returns a resources size' do
      expect(JSON.parse(response.body).size).to eq 10
    end
    
    it 'returns a resource id' do
      expect(JSON.parse(response.body)[0]['id']).to be_truthy
    end

    it 'returns a resource kind_id' do
      expect(JSON.parse(response.body)[0]['kind_id']).to be_truthy
    end

    it 'returns a resource description' do
      expect(JSON.parse(response.body)[0]['description']).to be_truthy
    end

    it 'returns a resource status' do
      expect(JSON.parse(response.body)[0]['status']).to be_truthy
    end

    it 'returns a resource price' do
      expect(JSON.parse(response.body)[0]['price']).to be_truthy
    end

  end
end