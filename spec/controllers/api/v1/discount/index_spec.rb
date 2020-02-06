require 'rails_helper'

describe Api::V1::DiscountsController, type: :request do
  
  context "When get a discount list" do
    
    before :all do
      @user = create(:user)
      @headers = authenticated_header(@user)
      create_list(:discount, 10)
      get '/api/v1/discounts', headers: @headers
    end

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns a resources size' do
      expect(JSON.parse(response.body).size).to eq 10
    end

    it 'returns a resource name' do
      expect(JSON.parse(response.body)[0]['name'].class).to be String
    end

    it 'returns a resource descriptions' do
      expect(JSON.parse(response.body)[0]['description'].class).to be String
    end

    it 'returns a resource kind' do
      expect(JSON.parse(response.body)[0]['kind'].class).to be String
    end

    it 'returns a resource status' do
      expect(JSON.parse(response.body)[0]['status'].class).to be String
    end

    it 'returns a resource value' do
      expect(JSON.parse(response.body)[0]['value'].class).to be String
    end
  end
  
end