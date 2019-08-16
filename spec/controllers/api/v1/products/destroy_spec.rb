require 'rails_helper'

describe Api::V1::ProductsController, type: :request do
  
  context 'When delete a product' do
    
    before :all do
      @prod = create(:product)
      delete "/api/v1/products/#{@prod.id}"
    end

    it 'returns HTTP response 204' do
      expect(response).to have_http_status 204
    end

  end
end