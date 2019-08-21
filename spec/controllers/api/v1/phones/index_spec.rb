require 'rails_helper'

describe Api::V1::PhonesController, type: :request do
  
  context 'When get phones' do
    
    before :all do
      @phones = create_list(:phone, 10)
      create(:phone_with_user)
      create(:phone_with_client)
      get '/api/v1/phones'
    end

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns a resource size' do
      expect(JSON.parse(response.body).size).to eq 12
    end

    it 'returns resource kind' do
      expect(JSON.parse(response.body)[0]['kind']).to be_truthy
    end

    it 'returns resource user_id' do
      expect(JSON.parse(response.body)[0]['user_id']).to be nil
    end

    it 'returns resource client_id' do
      expect(JSON.parse(response.body)[0]['client_id']).to be nil
    end

    it 'returns resource num' do
      expect(JSON.parse(response.body)[0]['num']).to be_truthy
    end

    it 'returns a user phone' do
      expect(JSON.parse(response.body)[10]['user_id']).to be > 1
    end

    it 'returns a client phone' do
      expect(JSON.parse(response.body)[11]['client_id']).to be > 1
    end

  end
  
end