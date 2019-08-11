require 'rails_helper'

describe Api::V1::DocumentsController, type: :request do
  
  context 'When post a document without user and client' do
    
    before :all do
      @doc = build(:document)
      post '/api/v1/documents', params: @doc.attributes
    end

    it 'returns a HTTP status 201' do
      expect(response).to have_http_status(201)
    end

    it 'returns a resource size' do
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

  context 'When post a document with user' do
    
    before :all do
      @user = build(:document_user)
      post '/api/v1/documents', params: @user.attributes
    end

    it 'returns a HTTP status 200' do
      expect(response).to have_http_status(201)
    end

    it 'returns a resource size' do
      expect(JSON.parse(response.body).size).to eq 5
    end

    it 'returns a user_id attribute' do
      expect(JSON.parse(response.body)['user_id']).to eq @user.user_id
    end

    it 'returns a nil client_id' do
      expect(JSON.parse(response.body)['client_id']).to be nil
    end

  end

  context 'When post a document with client' do
    
    before :all do
      @client = build(:document_client)
      post '/api/v1/documents', params: @client.attributes
    end

    it 'returns a HTTP status 200' do
      expect(response).to have_http_status(201)
    end

    it 'returns a resource size' do
      expect(JSON.parse(response.body).size).to eq 5
    end

    it 'returns a nil user_id attribute' do
      expect(JSON.parse(response.body)['user_id']).to be nil
    end

    it 'returns a client_id' do
      expect(JSON.parse(response.body)['client_id']).to eq @client.client_id
    end
    
  end

end