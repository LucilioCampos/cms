require 'rails_helper'

describe Api::V1::ProductsController, type: :request do
  
  context 'When get product list' do
    
    before :all do
      create_list(:product, 10)
      get '/api/v1/products'
    end

    it 'returns HTTP status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns a resources size' do
      expect(JSON.parse(response.body).size).to eq 10
    end

    it 'returns a id attribute' do
      expect(JSON.parse(response.body)[0]['id'].class).to be Integer
    end

    it 'returns a kind_id attribute' do
      expect(JSON.parse(response.body)[0]['kind_id'].class).to be Integer
    end

    it 'returns a description attribute' do
      expect(JSON.parse(response.body)[0]['description']).to be_truthy
    end

    it 'returns a status attribute' do
      expect(JSON.parse(response.body)[0]['status']).to be_truthy
    end

    it 'returns a price attribute' do
      expect(JSON.parse(response.body)[0]['price'].class).to be Float
    end

  end
end