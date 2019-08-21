require 'rails_helper'

describe Api::V1::AddressesController, type: :request do
  
  context 'When update an address without user and client' do
    
    before :all do
      @old_add = create(:address)
      @new_add = build(:address)
      put "/api/v1/addresses/#{@old_add.id}", params: @new_add.attributes
    end

    it 'returns HTTP status 202' do
      expect(response).to have_http_status(202)
    end

    it 'returns all attributes' do
      expect(JSON.parse(response.body).size).to eq 9
    end

    it 'returns a new state attributes' do
      expect(JSON.parse(response.body)['state']).to eq @new_add.state
    end

    it 'returns a new city attributes' do
      expect(JSON.parse(response.body)['city']).to eq @new_add.city
    end

    it 'returns a new neighborhood attributes' do
      expect(JSON.parse(response.body)['neighborhood']).to eq @new_add.neighborhood
    end

    it 'returns a new street attributes' do
      expect(JSON.parse(response.body)['street']).to eq @new_add.street
    end

    it 'returns a new notes attributes' do
      expect(JSON.parse(response.body)['notes']).to eq @new_add.notes
    end
    
    it 'returns a nil user_id attributes' do
      expect(JSON.parse(response.body)['user_id']).to be nil
    end

    it 'returns a nil client_id attributes' do
      expect(JSON.parse(response.body)['client_id']).to be nil
    end

  end

  context 'When update an address with user' do
    
    before :all do
      @old_add = create(:address)
      @new_add = build(:address_with_user)
      put "/api/v1/addresses/#{@old_add.id}", params: @new_add.attributes
    end

    it 'returns HTTP status 202' do
      expect(response).to have_http_status(202)
    end

    it 'returns all attributes' do
      expect(JSON.parse(response.body).size).to eq 9
    end
    
    it 'returns a new user_id attributes' do
      expect(JSON.parse(response.body)['user_id']).to eq @new_add.user_id
    end

    it 'returns a nil client_id attributes' do
      expect(JSON.parse(response.body)['client_id']).to be nil
    end

  end

  context 'When update an address with client' do
    
    before :all do
      @old_add = create(:address_with_client)
      @new_add = build(:address_with_client)
      put "/api/v1/addresses/#{@old_add.id}", params: @new_add.attributes
    end

    it 'returns HTTP status 202' do
      expect(response).to have_http_status(202)
    end

    it 'returns all attributes' do
      expect(JSON.parse(response.body).size).to eq 9
    end
    
    it 'returns a new user_id attributes' do
      expect(JSON.parse(response.body)['user_id']).to be nil
    end

    it 'returns a nil client_id attributes' do
      expect(JSON.parse(response.body)['client_id']).to eq @new_add.client_id
    end

  end

end