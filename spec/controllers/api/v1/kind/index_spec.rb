require 'rails_helper'

describe Api::V1::KindsController, type: :request do
  
  context 'When get all kinds' do
    
    before :all do
      create_list(:kind, 10)
      get '/api/v1/kinds'
    end

    it 'returns HTTP status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns a resources size' do
      expect(JSON.parse(response.body).size).to eq 10
    end

    it 'returns a resource id' do
      expect(JSON.parse(response.body)[0]['id']).to be_truthy
    end

    it 'returns a resource name' do
      expect(JSON.parse(response.body)[0]).to_not be nil
    end

    it 'returns a resource description' do
      expect(JSON.parse(response.body)[0]['description']).to_not be nil
    end

  end
end