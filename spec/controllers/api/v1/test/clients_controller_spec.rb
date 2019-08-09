require 'rails_helper'

describe 'ClientsController', type: :request do
  before :all do
    @base_url = '/api/v1/clients'
  end

  context 'GET /clients', type: :request do

    before do
      create_list(:client, 10)
      get @base_url
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq 10
      expect(JSON.parse(response.body)[0]['company']).to be_truthy
      expect(JSON.parse(response.body)[0]['email']).to be_truthy
      expect(JSON.parse(response.body)[0]['user_id']).to be_truthy
      expect(JSON.parse(response.body)[0]['notes']).to be_truthy
      expect(JSON.parse(response.body)[0]['status']).to eq 'active'
    end

  end

  context 'GET /clients/id' do
    
    before do
      client = create(:client)
      get "#{@base_url}/#{client.id}"
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq 10
    end
  end

  context 'POST /api/v1/clients', type: :request do

    before :all do
      @cliente = build(:client)
      post "#{@base_url}", params: @cliente.attributes
    end

    it 'returns the clients name' do
      expect(JSON.parse(response.body)['name']).to eq @cliente.name
    end

    it 'returns the clients company' do
      expect(JSON.parse(response.body)['company']).to eq @cliente.company
    end

    it 'returns the clients email' do
      expect(JSON.parse(response.body)['email']).to eq @cliente.email
    end

    it 'returns the clients user_id' do
      expect(JSON.parse(response.body)['user_id']).to eq @cliente.user_id
    end

    it 'returns the clients notes' do
      expect(JSON.parse(response.body)['notes']).to eq @cliente.notes
    end

    it 'returns the clients status' do
      expect(JSON.parse(response.body)['status']).to eq @cliente.status
    end

  end

  context 'PUT /api/v1/clients/:id' do
    
    before :all do
      @cliente = create(:client)
      @new_params = build(:client, status: :inactive)
      
      put "#{@base_url}/#{@cliente.id}", params: @new_params.attributes
    end

    it 'returns HTTP success' do
      expect(response.status).to eq(202)
      
    end

    it 'returns the clients name' do
      expect(JSON.parse(response.body)['name']).to eq @new_params.name
    end

    it 'returns the clients company' do
      expect(JSON.parse(response.body)['company']).to eq @new_params.company
    end

    it 'returns the clients email' do
      expect(JSON.parse(response.body)['email']).to eq @new_params.email
    end

    it 'returns the clients user_id' do
      expect(JSON.parse(response.body)['user_id']).to eq @new_params.user_id
    end

    it 'returns the clients notes' do
      expect(JSON.parse(response.body)['notes']).to eq @new_params.notes
    end

    it 'returns the clients status' do
      expect(JSON.parse(response.body)['status']).to eq @new_params.status
    end

  end

  context 'DELETE /api/v1/clients' do
    
    before :all do
      @cliente = create(:client)
      delete "#{@base_url}/#{@cliente.id}"
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(204)
      @cliente.destroy
    end

  end
end