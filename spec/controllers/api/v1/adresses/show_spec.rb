require 'rails_helper'

describe Api::V1::AddressesController, type: :request do
  
  context 'When get a address without user and client' do
    
    before :all do
      @add = create(:address)
      get "/api/v1/addresses/#{@add.id}"
    end

    it 'returns HTTP status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns all attributes' do
      expect(JSON.parse(response.body).size).to eq 9
    end

    it 'returns a state attributes' do
      expect(JSON.parse(response.body)['state']).to eq @add.state
    end

    it 'returns a city attributes' do
      expect(JSON.parse(response.body)['city']).to eq @add.city
    end

    it 'returns a neighborhood attributes' do
      expect(JSON.parse(response.body)['neighborhood']).to eq @add.neighborhood
    end

    it 'returns a street attributes' do
      expect(JSON.parse(response.body)['street']).to eq @add.street
    end

    it 'returns a cep attributes' do
      expect(JSON.parse(response.body)['cep']).to eq @add.cep
    end

    it 'returns a notes attributes' do
      expect(JSON.parse(response.body)['notes']).to eq @add.notes
    end
    
    it 'returns a nil user_id attributes' do
      expect(JSON.parse(response.body)['user_id']).to be nil
    end

    it 'returns a nil client_id attributes' do
      expect(JSON.parse(response.body)['client_id']).to be nil
    end

  end

  context 'When get a address with client' do
    
    before :all do
      @add = create(:address_with_client)
      get "/api/v1/addresses/#{@add.id}"
    end

    it 'returns HTTP status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns all attributes' do
      expect(JSON.parse(response.body).size).to eq 9
    end

    it 'returns a state attributes' do
      expect(JSON.parse(response.body)['state']).to eq @add.state
    end

    it 'returns a city attributes' do
      expect(JSON.parse(response.body)['city']).to eq @add.city
    end

    it 'returns a neighborhood attributes' do
      expect(JSON.parse(response.body)['neighborhood']).to eq @add.neighborhood
    end

    it 'returns a street attributes' do
      expect(JSON.parse(response.body)['street']).to eq @add.street
    end

    it 'returns a notes attributes' do
      expect(JSON.parse(response.body)['notes']).to eq @add.notes
    end
    
    it 'returns a nil user_id attributes' do
      expect(JSON.parse(response.body)['user_id']).to be nil
    end

    it 'returns a nil client_id attributes' do
      expect(JSON.parse(response.body)['client_id']).to eq @add.client_id
    end

  end
  context 'When get a address with user' do
    
    before :all do
      @add = create(:address_with_user)
      get "/api/v1/addresses/#{@add.id}"
    end

    it 'returns HTTP status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns all attributes' do
      expect(JSON.parse(response.body).size).to eq 9
    end

    it 'returns a state attributes' do
      expect(JSON.parse(response.body)['state']).to eq @add.state
    end

    it 'returns a city attributes' do
      expect(JSON.parse(response.body)['city']).to eq @add.city
    end

    it 'returns a neighborhood attributes' do
      expect(JSON.parse(response.body)['neighborhood']).to eq @add.neighborhood
    end

    it 'returns a street attributes' do
      expect(JSON.parse(response.body)['street']).to eq @add.street
    end

    it 'returns a notes attributes' do
      expect(JSON.parse(response.body)['notes']).to eq @add.notes
    end
    
    it 'returns a nil user_id attributes' do
      expect(JSON.parse(response.body)['user_id']).to eq @add.user_id
    end

    it 'returns a nil client_id attributes' do
      expect(JSON.parse(response.body)['client_id']).to be nil
    end

  end
end