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
      puts (JSON.parse(response.body)[0]['nome'])
      expect(JSON.parse(response.body)[0]['nome']).to be_truthy
      expect(JSON.parse(response.body)[0]['status']).to eq 'active'
      expect(JSON.parse(response.body)[0]['tipo']).to eq 'manager'
      expect(JSON.parse(response.body)[0]['observacoes']).to be_truthy
      expect(JSON.parse(response.body)[0]['telefones']).to be_truthy
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
      expect(JSON.parse(response.body)[0]['nome']).to eq @user.name
    end

    it 'returns HTTP success without a result' do
      get "#{@base_url}?search_name=12345"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq 0
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
      expect(JSON.parse(response.body)['nome']).to eq 'Usuário Teste'
    end

    it 'returns the users status' do
      expect(JSON.parse(response.body)['status']).to eq 'active'
    end

    it 'returns the users kind' do
      expect(JSON.parse(response.body)['tipo']).to eq 'manager'
    end

    it 'returns the users notes' do
      expect(JSON.parse(response.body)['observacoes']).to include 'to do tests'
    end
  end

  context 'PUT /api/v1/users/:id' do
    
    before :all do
      @user = FactoryBot.create(:random_users)
      @new_name = Faker::Name.name
      @notes = Faker::Lorem.sentence(10)
    end

    it 'returns HTTP success' do
      put "#{@base_url}/#{@user.id}", params: {
        name: @new_name, notes: @notes
      }
      expect(response.status).to eq(202)
      
    end

    it 'returns the users name' do
      expect(User.find(@user.id).name).to eq @new_name
    end

    it 'returns the users notes' do
      expect(User.find(@user.id).notes).to eq @notes
    end

  end
end