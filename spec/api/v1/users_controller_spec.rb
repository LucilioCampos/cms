require 'rails_helper'

describe 'UsersController', type: :request do
  let!(:users) { FactoryBot.create_list(:random_users, 10) }
  before :all do
    @base_url = '/api/v1/users'
  end

  context 'GET /users', type: :request do

    before do
      get @base_url
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq 10
      puts (JSON.parse(response.body)[0]['name'])
      expect(JSON.parse(response.body)[0]['name']).to be_truthy
      expect(JSON.parse(response.body)[0]['status']).to eq 'active'
      expect(JSON.parse(response.body)[0]['kind']).to eq 'manager'
      expect(JSON.parse(response.body)[0]['notes']).to be_truthy
      expect(JSON.parse(response.body)[0]['phones']).to be_truthy
    end

  end

  context 'GET /users/id' do

    before do
      get "#{@base_url}/10"
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq 6
    end
  end

  context 'GET /api/v1/users with params' do

    before :all do
      @user = User.first
      get "#{@base_url}?search_name=#{@user.name}"
    end

    it 'returns HTTPS success' do
      
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq 1
      expect(JSON.parse(response.body)[0].size).to eq 6
      expect(JSON.parse(response.body)[0]['name']).to eq @user.name
    end

    it 'returns HTTP success without a result' do
      get "#{@base_url}?search_name=12345"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq 0
    end
    
  end

  context 'POST /api/v1/users', type: :request do

    before :all do
      @user = FactoryBot.create(:random_users)
      post "#{@base_url}", params: { 
        name: 'Usuário Teste', 
        status: 'active', 
        kind: 'manager',
        notes: 'User created to do tests',
        phones_attributes: [{ kind: 'fix', num: '123456' }]
      }
    end

    it 'returns the users name' do
      expect(JSON.parse(response.body)['name']).to eq 'Usuário Teste'
    end

    it 'returns the users status' do
      expect(JSON.parse(response.body)['status']).to eq 'active'
    end

    it 'returns the users kind' do
      expect(JSON.parse(response.body)['kind']).to eq 'manager'
    end

    it 'returns the users notes' do
      expect(JSON.parse(response.body)['notes']).to include 'to do tests'
    end
  end

  context 'PUT /api/v1/users/:id' do
    
    before :all do
      @user = FactoryBot.create(:random_users)
      @new_name = Faker::Name.name
      @notes = Faker::Lorem.sentence(10)
      post "#{@base_url}", params: {
        name: @user.name,
        notes: @user.notes
      }
    end

    before :each do
      put "#{@base_url}/#{@user.id}", params: {
        name: @new_name, notes: @notes
      }
    end

    it 'returns HTTP success' do
      expect(response.status).to eq(202)
      
    end

    it 'returns the users name' do
      expect(JSON.parse(response.body)['name']).to eq @new_name
    end

    it 'returns the users notes' do
      expect(JSON.parse(response.body)['notes']).to eq @notes
    end

  end

  context 'DELETE /api/v1/users' do
    
    before :all do
      @user = User.all.last
      delete "#{@base_url}/#{@user.id}"
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(204)
    end

    it 'should not return a deleted user' do
      last_user = User.last
      expect(last_user.id).to_not eq @user.id
      expect(last_user.name).to_not eq @user.name
      expect(last_user.notes).to_not eq @user.notes
    end

  end
end