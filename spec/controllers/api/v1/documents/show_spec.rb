require 'rails_helper'

describe Api::V1::DocumentsController, type: :request do
  
  context 'When get a document without user or client' do
    
    before :all do
      @doc = create(:document)
      get "/api/v1/documents/#{@doc.id}"
    end

    it 'returns a HTTP status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns a resources size' do
      expect(JSON.parse(response.body).size).to eq 5
    end

    it 'returns a kind attribute' do
      expect(JSON.parse(response.body)['kind']).to eq @doc.kind
    end

    it 'returns a num attribute' do
      expect(JSON.parse(response.body)['num']).to eq @doc.num
    end

    it 'returns a nil user_id attribute' do
      expect(JSON.parse(response.body)['user_id']).to be nil
    end

    it 'returns a nil client_id attribute' do
      expect(JSON.parse(response.body)['client_id']).to be nil
    end

  end

  context 'When GET a document with user' do
    
    before :all do
      @user = create(:document_user)
      get "/api/v1/documents/#{@user.id}"
    end

    it 'returns a HTTP status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns a document resource size' do
      expect(JSON.parse(response.body).size).to eq 5
    end

    it 'returns a user_id attribute' do
      expect(JSON.parse(response.body)['user_id']).to eq @user.user_id
    end

    it 'returns a nil client_id attribute' do
      expect(JSON.parse(response.body)['client_id']).to be nil
    end

  end

  context 'When GET a document with client' do
    
    before :all do
      @client = create(:document_client)
      get "/api/v1/documents/#{@client.id}"
    end

    it 'returns a HTTP status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns a document resource size' do
      expect(JSON.parse(response.body).size).to eq 5
    end

    it 'returns a user_id attribute' do
      expect(JSON.parse(response.body)['user_id']).to be nil
    end

    it 'returns a nil client_id attribute' do
      expect(JSON.parse(response.body)['client_id']).to eq @client.client_id
    end
    
  end

end