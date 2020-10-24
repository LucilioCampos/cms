require 'rails_helper'

describe Api::V1::ClientsController, type: :request do


  context 'GET /clients/id' do
      
    before do
      @user = create(:user)
      @headers = authenticated_header
      client = create(:client)
      get "/api/v1/clients/#{client.id}", headers: @headers
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq 10
    end
    
  end
 
end