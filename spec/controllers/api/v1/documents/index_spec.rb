require 'rails_helper'

describe Api::V1::DocumentsController, type: :request do
  
  context 'When GET documents' do
    
    before :all do
      @user = create(:user)
      @headers = authenticated_header(@user)
      create_list(:document, 10)
      create_list(:document_user, 10)
      create_list(:document_client, 10)
      get '/api/v1/documents', headers: @headers 
    end

    it 'returns HTTP status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns 30 documents size' do
      expect(JSON.parse(response.body).size).to eq 30
    end

    it 'returns 10 documents with users' do
      resp = JSON.parse(response.body).select { |user| user['user_id'] != nil }
      expect(resp.size).to eq 10
    end

    it 'returns 10 documents with clients' do
      resp = JSON.parse(response.body).select { |client| client['client_id'] != nil }
      expect(resp.size).to eq 10
    end

  end
end