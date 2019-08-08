require 'rails_helper'

describe 'AddressesController', type: :request do
  
  before :all do 
    @base_url = '/api/v1/addresses' 
  end

  context 'When get /api/v1/addresses' do
    
    before :all do
      create_list(:address, 10)
      create_list(:address_with_user, 10)
      create_list(:address_with_client, 10)
      get @base_url
    end

    it 'returns HTTP response 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns 30 address created' do
      expect(JSON.parse(response.body).size).to be 30
    end

    it 'returns 10 address with users' do
      resp = JSON.parse(response.body)
      expect(resp.select { |user| user['user_id'] != nil }.size).to eq 10
    end

    it 'returns 10 address with client' do
      resp = JSON.parse(response.body)
      @clients = 
      expect(resp.select { |client| client['client_id'] != nil }.size).to eq 10
    end

  end

end