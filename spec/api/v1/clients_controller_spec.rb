require 'rails_helper'

describe 'ClientsController', type: :request do
  let!(:clients) { FactoryBot.create_list(:random_clients, 10) }
  before :all do
    @base_url = '/api/v1/clients'
  end

  context 'GET /clients', type: :request do

    before do
      get @base_url
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq 10
      puts (JSON.parse(response.body)[0]['name'])
      expect(JSON.parse(response.body)[0]['company']).to be_truthy
      expect(JSON.parse(response.body)[0]['email']).to be_truthy
      expect(JSON.parse(response.body)[0]['user_id']).to be_truthy
      expect(JSON.parse(response.body)[0]['notes']).to be_truthy
      expect(JSON.parse(response.body)[0]['status']).to eq 'active'
    end

  end

  context 'GET /clients/id' do

    before do
      get "#{@base_url}/10"
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq 8
    end
  end

  context 'POST /api/v1/clients', type: :request do

    before :all do
      post "#{@base_url}", params: { 
        name: 'Usuário Teste', 
        company: 'Tabajara', 
        email: 'cliente@soucliente.com',
        user_id: 2,
        notes: 'Client created to do tests',
        status: :active,
        phones_attributes: [{ kind: 'fix', num: '123456' }]
      }
    end

    it 'returns the clients name' do
      expect(JSON.parse(response.body)['name']).to eq 'Usuário Teste'
    end

    it 'returns the clients company' do
      expect(JSON.parse(response.body)['company']).to eq 'Tabajara'
    end

    it 'returns the clients email' do
      expect(JSON.parse(response.body)['email']).to eq 'cliente@soucliente.com'
    end

    it 'returns the clients user_id' do
      expect(JSON.parse(response.body)['user_id']).to eq 2
    end

    it 'returns the clients notes' do
      expect(JSON.parse(response.body)['notes']).to eq 'Client created to do tests'
    end

    it 'returns the clients status' do
      expect(JSON.parse(response.body)['status']).to eq 'active'
    end

    it 'returns the clients phones kind' do
      expect(JSON.parse(response.body)['phones'][0]['kind']).to eq 'fix'
    end

    it 'returns the clients phones number' do
      expect(JSON.parse(response.body)['phones'][0]['num']).to eq '123456'
    end
  end

  context 'PUT /api/v1/clients/:id' do
    
    before :all do
      @client = FactoryBot.create(:random_clients)
      @new_name = Faker::Name.name
      @new_company = Faker::Company.name
      @new_email = Faker::Internet.email
      @new_user = 3
      @new_notes = Faker::Lorem.sentence(10)
      @new_status = 'inactive'
      @new_phone = [{kind: :home, num: '654321'}]
      
      post "#{@base_url}", params: {
        name: @client.name,
        company: @client.company,
        email: @client.email,
        user_id: @client.user_id,
        notes: @client.notes,
        status: @client.status
      }
    end

    before :each do
      put "#{@base_url}/#{@client.id}", params: {
        name: @new_name,
        company: @new_company,
        email: @new_email,
        user_id: @new_user,
        notes: @new_notes,
        status: @new_status,
        phones_attributes: @new_phone
      }
    end

    it 'returns HTTP success' do
      expect(response.status).to eq(202)
      
    end

    it 'returns the clients name' do
      expect(JSON.parse(response.body)['name']).to eq @new_name
    end

    it 'returns the clients company' do
      expect(JSON.parse(response.body)['company']).to eq @new_company
    end

    it 'returns the clients email' do
      expect(JSON.parse(response.body)['email']).to eq @new_email
    end

    it 'returns the clients user_id' do
      expect(JSON.parse(response.body)['user_id']).to eq 3
    end

    it 'returns the clients notes' do
      expect(JSON.parse(response.body)['notes']).to eq @new_notes
    end

    it 'returns the clients status' do
      expect(JSON.parse(response.body)['status']).to eq @new_status
    end

    it 'returns the clients phones kind' do
      expect(JSON.parse(response.body)['phones'][0]['kind']).to eq 'home'
    end

    it 'returns the clients phones number' do
      expect(JSON.parse(response.body)['phones'][0]['num']).to eq '654321'
    end

  end

  context 'DELETE /api/v1/clients' do
    
    before :all do
      @client = User.all.last
      delete "#{@base_url}/#{@client.id}"
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(204)
    end

    it 'should not return a deleted user' do
      last_client = Client.last
      expect(last_client.id).to_not eq @client.id
      expect(last_client.name).to_not eq @client.name
      expect(last_client.notes).to_not eq @client.notes
    end

  end
end