require 'rails_helper'

describe Api::V1::DiscountsController, type: :request do
  
  context 'When delete a discount' do
    
    before :all do
      disc = create(:discount)
      delete "/api/v1/discounts/#{disc.id}"
    end

    it 'returns HTTP status 204' do
      expect(response).to have_http_status 204
    end
    
  end
end