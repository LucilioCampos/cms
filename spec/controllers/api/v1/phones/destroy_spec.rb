require 'rails_helper'

describe Api::V1::PhonesController, type: :request do
      
  context 'When delete a phone' do
    
    before :all do
      @delete = create(:phone)
      delete "/api/v1/phones/#{@delete.id}"
    end

    it 'returns a HTTP status 204' do
      expect(response).to have_http_status(204)
    end

  end

  context 'When delete a phone with user' do
    
    before :all do
      @delete =  create(:phone_with_user)
      delete "/api/v1/phones/#{@delete.id}"
    end

    it 'returns a HTTP status 204' do
      expect(response).to have_http_status(204)
    end

  end

  context 'When delete a phone with client' do
    
    before :all do
      @delete =  create(:phone_with_client)
      delete "/api/v1/phones/#{@delete.id}"
    end

    it 'returns a HTTP status 204' do
      expect(response).to have_http_status(204)
    end

  end

end