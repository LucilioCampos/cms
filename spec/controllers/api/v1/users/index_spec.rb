require 'rails_helper'

describe 'UsersController', type: :request do

  before :all do
    @base_url = '/api/v1/users'
  end

  context 'GET /users', type: :request do

    before do
      create_list(:user, 10)
      get @base_url
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a resource size' do
      expect(JSON.parse(response.body).size).to be > 1
    end

    it 'returns a resource name' do
      expect(JSON.parse(response.body)[0]['name']).to be_truthy
    end

    it 'returns a resource status' do
      expect(JSON.parse(response.body)[0]['status']).to eq 'active'
    end

    it 'returns a resource kind' do
      expect(JSON.parse(response.body)[0]['kind']).to eq 'manager'
    end

    it 'returns a resource notes' do
      expect(JSON.parse(response.body)[0]['notes']).to be_truthy
    end

    it 'returns a resource phone' do
      expect(JSON.parse(response.body)[0]['phones']).to be_truthy
    end

  end

  context 'GET /users/id' do

    before do
      users = create(:user)
      get "#{@base_url}/#{users.id}"
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq 8
    end
  end

  context 'GET /api/v1/users with params' do

    before :all do
      @users = create(:user)
      get "#{@base_url}?search_name=#{@users.name}"
    end

    it 'returns HTTPS success' do
      
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq 1
      expect(JSON.parse(response.body)[0].size).to eq 8
      expect(JSON.parse(response.body)[0]['name']).to eq @users.name
    end

    it 'returns HTTP success without a result' do
      get "#{@base_url}?search_name=12345"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq 0
    end
    
  end
end