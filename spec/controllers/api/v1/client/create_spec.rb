require 'rails_helper'

def authenticated_header(user)
  token = Knock::AuthToken.new(payload: { sub: user.id }).token
  { 'Authorization': "Bearer #{token}" }
end

describe Api::V1::ClientsController, type: :request do

  context 'When create a new cliente' do

    before :all do
      @user = create(:user)
      @headers = authenticated_header(@user)
      @cliente = build(:client)
      post "/api/v1/clients", params: @cliente.attributes, headers: @headers
    end

    it 'returns HTTP status 201' do
      expect(response).to have_http_status 201
    end

    it 'returns a resource size' do
      expect(JSON.parse(response.body).size).to eq 10
    end

    it 'returns the clients name' do
      expect(JSON.parse(response.body)['name']).to eq @cliente.name
    end

    it 'returns the clients company' do
      expect(JSON.parse(response.body)['company']).to eq @cliente.company
    end

    it 'returns the clients email' do
      expect(JSON.parse(response.body)['email']).to eq @cliente.email
    end

    it 'returns the clients user_id' do
      expect(JSON.parse(response.body)['user_id']).to eq @cliente.user_id
    end

    it 'returns the clients notes' do
      expect(JSON.parse(response.body)['notes']).to eq @cliente.notes
    end

    it 'returns the clients status' do
      expect(JSON.parse(response.body)['status']).to eq @cliente.status
    end

  end
    
end