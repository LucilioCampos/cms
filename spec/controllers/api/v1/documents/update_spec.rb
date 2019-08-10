require 'rails_helper'

describe Api::V1::DocumentsController, type: :request do
  
  context 'When Update a document without user and client' do
    
    before :all do
      @old_doc = create(:document)
      @new_doc = build(:document, kind: :cpf)
      put "/api/v1/documents/#{@old_doc.id}", params: @new_doc.attributes
    end

    it 'returns HTTP status 202' do
      expect(response).to have_http_status(202)
    end

    it 'returns a resources size' do
      expect(JSON.parse(response.body).size).to eq 5
    end

    it 'returns a kind attribute' do
      expect(JSON.parse(response.body)['kind']).to eq @new_doc.kind
    end

    it 'returns a num attribute' do
      expect(JSON.parse(response.body)['num']).to eq @new_doc.num
    end

    it 'returns a nil user_id attribute' do
      expect(JSON.parse(response.body)['user_id']).to be nil
    end

    it 'returns a nil client_id attribute' do
      expect(JSON.parse(response.body)['client_id']).to be nil
    end

  end

  context 'When update a document with user' do
    
    before :all do
      @old_doc = create(:document_user)
      @new_doc = build(:document_user)
      put "/api/v1/documents/#{@old_doc.id}", params: @new_doc.attributes
    end
    
    it 'returns HTTP status 200' do
      expect(response).to have_http_status(202)
    end

    it 'returns a resource size' do
      expect(JSON.parse(response.body).size).to eq 5
    end

    it 'returns a new value user_id' do
      expect(JSON.parse(response.body)['user_id']).to eq @new_doc.user_id
    end

    it 'returns a nil client_id value' do
      expect(JSON.parse(response.body)['client_id']).to be nil
    end

  end

  context 'When update a document with client_id' do
    
    before :all do
      @old_doc = create(:document_client)
      @new_doc = build(:document_client)
      put "/api/v1/documents/#{@old_doc.id}", params: @new_doc.attributes
    end
    
    it 'returns HTTP status 200' do
      expect(response).to have_http_status(202)
    end

    it 'returns a resource size' do
      expect(JSON.parse(response.body).size).to eq 5
    end

    it 'returns a new value user_id' do
      expect(JSON.parse(response.body)['user_id']).to be nil
    end

    it 'returns a nil client_id value' do
      expect(JSON.parse(response.body)['client_id']).to eq @new_doc.client_id
    end
    
  end
end