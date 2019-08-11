require 'rails_helper'

describe Api::V1::KindsController, type: :request do
  
  context 'GET /kinds/id', type: :request do

    before do
      @kind = create(:kind)
      get "/api/v1/kinds/#{@kind.id}"
    end
    
    it 'returns HTTP success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a resource size' do
      expect(JSON.parse(response.body).size).to eq 3
    end

    it 'returns a resource id' do
      expect(JSON.parse(response.body)['id']).to eq @kind.id
    end

    it 'returns a resource name' do
      expect(JSON.parse(response.body)['name']).to eq @kind.name
    end

    it 'returns a resource description' do
      expect(JSON.parse(response.body)['description']).to eq @kind.description
    end
    
  end
end