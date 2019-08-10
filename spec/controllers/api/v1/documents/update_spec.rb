require 'rails_helper'

describe Api::V1::DocumentsController, type: :request do
  
  context 'When Update a document without user and client' do
    
    before :all do
      @old_doc = create(:document)
      @new_doc = build(:document)
      put "/api/v1/documents/#{@old_doc.id}", params: @new_doc.attributes
    end

    it 'returns HTTP status 202' do
      expect(response).to have_http_status(202)
    end

  end
end