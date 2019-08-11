require 'rails_helper'

describe Api::V1::KindsController, type: :request do
  
  context 'When delete a kind' do
    
    before :all do
      @kind = create(:kind)
      delete "/api/v1/kinds/#{@kind.id}"
    end

    it 'returns HTTP status 204' do
      expect(response).to have_http_status 204
    end

  end
end