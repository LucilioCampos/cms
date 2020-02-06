require 'rails_helper'

def authenticated_header(user)
  token = Knock::AuthToken.new(payload: { sub: user.id }).token
  { 'Authorization': "Bearer #{token}" }
end

describe Api::V1::ClientsController, type: :request do
  context 'DELETE /api/v1/clients' do
    
    before :all do
      @user = create(:user)
      @headers = authenticated_header(@user)
      @cliente = create(:client)
      delete "/api/v1/clients/#{@cliente.id}", headers: @headers
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(204)
      @cliente.destroy
    end

  end
  
end