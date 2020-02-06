require 'rails_helper'

def authenticated_header(user)
  token = Knock::AuthToken.new(payload: { sub: user.id }).token
  { 'Authorization': "Bearer #{token}" }
end

describe Api::V1::ClientsController, type: :request do


  context 'GET /clients/id' do
      
    before do
      @user = create(:user)
      @headers = authenticated_header(@user)
      client = create(:client)
      get "/api/v1/clients/#{client.id}", headers: @headers
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq 10
    end
    
  end
 
end