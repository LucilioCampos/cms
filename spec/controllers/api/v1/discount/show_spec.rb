require 'rails_helper'

describe Api::V1::DiscountsController, type: :request do
  
  context 'When get a discount' do
    
    before :all do
      @user = create(:user)
      @headers = authenticated_header(@user)
      @disc = create(:discount)
      get "/api/v1/discounts/#{@disc.id}", headers: @headers
    end

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns a resource size' do
      expect(JSON.parse(response.body).size).to eq 6
    end

    it  'returns a resource id' do
      expect(JSON.parse(response.body)['id']).to eq @disc.id
    end

    it  'returns a resource name' do
      expect(JSON.parse(response.body)['name']).to eq @disc.name
    end

    it  'returns a resource description' do
      expect(JSON.parse(response.body)['description']).to eq @disc.description
    end

    it  'returns a resource kind' do
      expect(JSON.parse(response.body)['kind']).to eq @disc.kind
    end

    it  'returns a resource status' do
      expect(JSON.parse(response.body)['status']).to eq @disc.status
    end

    it  'returns a resource value' do
      expect(JSON.parse(response.body)['value'].class).to be String
    end

  end
end