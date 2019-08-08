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
      expect(JSON.parse(response.body).size).to be > 1
      expect(JSON.parse(response.body)[0]['name']).to be_truthy
      expect(JSON.parse(response.body)[0]['status']).to eq 'active'
      expect(JSON.parse(response.body)[0]['kind']).to eq 'manager'
      expect(JSON.parse(response.body)[0]['notes']).to be_truthy
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
      expect(JSON.parse(response.body).size).to eq 6
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
      expect(JSON.parse(response.body)[0].size).to eq 6
      expect(JSON.parse(response.body)[0]['name']).to eq @users.name
    end

    it 'returns HTTP success without a result' do
      get "#{@base_url}?search_name=12345"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq 0
    end
    
  end

  context 'POST /api/v1/users', type: :request do

    before :all do
      @users = create(:user)
      post "#{@base_url}", params: @users.attributes
    end

    it 'returns the users name' do
      expect(JSON.parse(response.body)['name']).to eq @users.name
    end

    it 'returns the users status' do
      expect(JSON.parse(response.body)['status']).to eq @users.status
    end

    it 'returns the users kind' do
      expect(JSON.parse(response.body)['kind']).to eq @users.kind
    end

    it 'returns the users notes' do
      expect(JSON.parse(response.body)['notes']).to eq @users.notes
    end
  end

  context 'PUT /api/v1/users/:id' do
    
    before :all do
      @old_user = create(:user)
      @new_user = build(:user)
      put "#{@base_url}/#{@old_user.id}", params: @new_user.attributes
    end

    it 'returns HTTP success' do
      expect(response.status).to eq(202)
    end

    it 'returns the new users name' do
      expect(JSON.parse(response.body)['name']).to eq @new_user.name
    end

    it 'returns the users notes' do
      expect(JSON.parse(response.body)['notes']).to eq @new_user.notes
    end

  end

  context 'DELETE /api/v1/users' do
    
    before :all do
      @delete_user = create(:user)
      delete "#{@base_url}/#{@delete_user.id}"
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(204)
    end

  end
end