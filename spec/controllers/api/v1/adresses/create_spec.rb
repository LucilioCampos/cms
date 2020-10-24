require 'rails_helper'


describe Api::V1::AddressesController, type: :request do
  
  context 'When create an address without user and client' do

    before :all do
      @add = build(:address)
      @user = create(:user, kind: :manager)
      @headers = authenticated_header
      post "/api/v1/addresses", headers: @headers, params: @add.attributes
    end

    it 'return HTTP status 201' do
      puts authenticated_header
      puts response.body
      expect(response).to have_http_status(201)
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
      expect(JSON.parse(response.body)['client_id']).to be nil
    end

  end

  context 'When create an address with user' do

    before :all do
      @add = build(:address_with_user)
      post "/api/v1/addresses", params: @add.attributes
    end

    it 'return HTTP status 201' do
      expect(response).to have_http_status(201)
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

  context 'When create an address with client' do

    before :all do
      @add = build(:address_with_client)
      post "/api/v1/addresses", params: @add.attributes
    end

    it 'return HTTP status 201' do
      expect(response).to have_http_status(201)
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


end