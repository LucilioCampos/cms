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
      expect(JSON.parse(response.body)[0]['name']).to be_truthy
    end

  end

  context 'GET /users/id' do

    before do
      get "#{@base_url}/20"
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq 6
    end
  end

  context 'GET /api/v1/users with params' do

    it 'returns HTTPS success' do
      get "#{@base_url}?campos=status,kind,notes"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq 10
    end
    
  end

  context 'POST /api/v1/users', type: :request do

    before do
     
      post "#{@base_url}", params: { 
        name: 'Usuário Teste', status: :active, kind: :manager,
        notes: 'User created to do tests'
      }
    end

    it 'returns the users name' do
      expect(JSON.parse(response.body)['data']['name']).to eq 'Usuário Teste'
    end

    it 'returns the users status' do
      expect(JSON.parse(response.body)['data']['status']).to eq 'active'
    end

    it 'return the users kind' do
      expect(JSON.parse(response.body)['data']['kind']).to eq 'manager'
    end

    it 'returns the users notes' do
      expect(JSON.parse(response.body)['data']['notes']).to include 'to do tests'
    end
  end

  context 'PUT /api/v1/users/:id' do
    
    before :each do
      @user = FactoryBot.create(:random_users)
      @new_name = Faker::Name.name
      @notes = Faker::Lorem.sentence(10)
    end

    it 'Updates a user' do
      put "#{@base_url}/#{@user.id}", params: {
        name: @new_name, notes: @notes
      }
      expect(response.status).to eq(202)
      expect(User.find(@user.id).name).to eq @new_name
      expect(User.find(@user.id).notes).to eq @notes
    end
  end
end