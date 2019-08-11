require 'rails_helper'

describe Api::V1::ClientsController, type: :request do

  context 'PUT /api/v1/clients/:id' do
      
    before :all do
      @cliente = create(:client)
      @new_params = build(:client, status: :inactive)
      
      put "/api/v1/clients/#{@cliente.id}", params: @new_params.attributes
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

end