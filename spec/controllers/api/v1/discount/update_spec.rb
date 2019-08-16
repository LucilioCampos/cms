require 'rails_helper'

describe Api::V1::DiscountsController, type: :request do
  
  context 'When update a discount' do
    
    before :all do
      @old = create(:discount)
      @new = build(:discount)
      put "/api/v1/discounts/#{@old.id}", params: @new.attributes
    end

    it 'returns a HTTP status 202' do
      expect(response).to have_http_status 202
    end

    it 'returns a resource size' do
      expect(JSON.parse(response.body).size).to eq 6
    end

    it  'returns a new name' do
      expect(JSON.parse(response.body)['name']).to eq @new.name
    end

    it  'returns a new description' do
      expect(JSON.parse(response.body)['description']).to eq @new.description
    end

    it  'returns a new kind' do
      expect(JSON.parse(response.body)['kind']).to eq @new.kind
    end

    it  'returns a new status' do
      expect(JSON.parse(response.body)['status']).to eq @new.status
    end

    it  'returns a new value' do
      expect(JSON.parse(response.body)['value'].class).to be String
    end

  end
end