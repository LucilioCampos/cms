require 'rails_helper'

describe Api::V1::PhonesController, type: :request do
  
  context "When get phone without user or client" do
    
    before :all do
      @phone = create(:phone)
      get "/api/v1/phones/#{@phone.id}"
    end

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns a resource size' do
      expect(JSON.parse(response.body).size).to eq 5
    end

    it 'returns resource kind' do
      expect(JSON.parse(response.body)['kind']).to eq @phone.kind
    end

    it 'returns resource user_id' do
      expect(JSON.parse(response.body)['user_id']).to be nil
    end

    it 'returns resource client_id' do
      expect(JSON.parse(response.body)['client_id']).to be nil
    end

    it 'returns resource num' do
      expect(JSON.parse(response.body)['num']).to eq @phone.num
    end

  end

  context "When get phone with user" do
    
    before :all do
      @user_phone = create(:phone_with_user)
      get "/api/v1/phones/#{@user_phone.id}"
    end

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns a resource size' do
      expect(JSON.parse(response.body).size).to eq 5
    end

    it 'returns resource kind' do
      expect(JSON.parse(response.body)['kind']).to eq @user_phone.kind
    end

    it 'returns resource user_id' do
      expect(JSON.parse(response.body)['user_id']).to eq @user_phone.user_id
    end

    it 'returns resource client_id' do
      expect(JSON.parse(response.body)['client_id']).to be nil
    end

    it 'returns resource num' do
      expect(JSON.parse(response.body)['num']).to eq @user_phone.num
    end

  end

  context "When get phone with client" do
    
    before :all do
      @client_phone = create(:phone_with_client)
      get "/api/v1/phones/#{@client_phone.id}"
    end

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns a resource size' do
      expect(JSON.parse(response.body).size).to eq 5
    end

    it 'returns resource kind' do
      expect(JSON.parse(response.body)['kind']).to eq @client_phone.kind
    end

    it 'returns resource user_id' do
      expect(JSON.parse(response.body)['user_id']).to be nil
    end

    it 'returns resource client_id' do
      expect(JSON.parse(response.body)['client_id']).to eq @client_phone.client_id
    end

    it 'returns resource num' do
      expect(JSON.parse(response.body)['num']).to eq @client_phone.num
    end

  end
  
end