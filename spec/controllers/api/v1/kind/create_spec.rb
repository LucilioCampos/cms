require 'rails_helper'

describe Api::V1::KindsController, type: :request do
  
  context 'When post a kind' do
    
    before :all do
      @kind = build(:kind)
      post '/api/v1/kinds', params: @kind.attributes
    end

    it 'returns a HTTP status 201' do
      expect(response).to have_http_status(201)
    end

    it 'returns a resource size' do
      expect(JSON.parse(response.body).size).to eq 3
    end

    it 'returns a kind name' do
      expect(JSON.parse(response.body)['name']).to eq @kind.name
    end

    it 'returns a kind description' do
      expect(JSON.parse(response.body)['description']).to eq @kind.description
    end

  end
end