require 'rails_helper'

describe Api::V1::ClientsController, type: :request do

  context 'GET /clients', type: :request do

    before do
      create_list(:client, 10)
      get  '/api/v1/clients'
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

end
