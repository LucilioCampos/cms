require 'rails_helper'

describe Api::V1::KindsController, type: :request do
  
  context 'When update a kind' do
    
    before :all do
      @old = create(:kind)
      @new = build(:kind)
      put "/api/v1/kinds/#{@old.id}", params: @new.attributes
    end

    it 'returns a HTTP status 202' do
      expect(response).to have_http_status 202
    end

    it 'returns a resource size' do
      expect(JSON.parse(response.body).size).to eq 3
    end

    it 'returns a new name' do
      expect(JSON.parse(response.body)['name']).to eq @new.name
    end

    it 'returns a new description' do
      expect(JSON.parse(response.body)['description']).to eq @new.description
    end
  end
end