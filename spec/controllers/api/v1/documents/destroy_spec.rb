require 'rails_helper'

describe Api::V1::DocumentsController, type: :request do
  
  context 'When destroy a document without user and client' do
    
    before :all do
      @user = create(:user)
      @headers = authenticated_header(@user)
      @doc = create(:document)
      delete "/api/v1/documents/#{@doc.id}", headers: @headers 
    end

    it 'returns HTTP status 204' do
      expect(response).to have_http_status(204)
    end

  end

  context 'When destroy a document with user' do
    
    before :all do
      @doc = create(:document_user)
      delete "/api/v1/documents/#{@doc.id}"
    end

    it 'returns HTTP status 204' do
      expect(response).to have_http_status(204)
    end

  end

  context 'When destroy a document with client' do
    
    before :all do
      @doc = create(:document_client)
      delete "/api/v1/documents/#{@doc.id}"
    end

    it 'returns HTTP status 204' do
      expect(response).to have_http_status(204)
    end

  end
end