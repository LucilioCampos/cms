require 'rails_helper'

describe 'DELETE /api/v1/address/:id', type: :request do
  
  context 'When delete a address without user or client' do
    
    before :all do
      @add = create(:address)
      delete "/api/v1/addresses/#{@add.id}"
    end

    it 'returns a HTTP status 204' do
      expect(response).to have_http_status(204)
    end

  end
  
end