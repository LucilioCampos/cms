require 'rails_helper'

describe 'KindsController', type: :request do

  before :all do
    @base_url = '/api/v1/kinds'
  end

  context 'GET /Kinds', type: :request do
    
    before do
      create_list(:kind, 10)
      get @base_url
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq 10
      expect(JSON.parse(response.body)[0]['id']).to be_truthy
      expect(JSON.parse(response.body)[0]['name']).to be_truthy
      expect(JSON.parse(response.body)[0]['description']).to be_truthy
    end
  end

  context 'GET /kinds/id', type: :request do

    before do
      kind = create(:kind)
      get "#{@base_url}/#{kind.id}"
    end
    
    it 'returns HTTP success' do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq 3
    end
    
  end

  context 'POST /api/v1/kinds', type: :request do

    before :all do
      post "#{@base_url}", params: { name: 'Testing', description: 'Testing'}
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(201)
    end

    it 'returns Kind name' do
      expect(JSON.parse(response.body)['name']).to eq 'Testing'
    end

    it 'returns Kind description' do
      expect(JSON.parse(response.body)['description']).to eq 'Testing'
    end

  end

  context 'PUT /api/v1/kinds' do

    before do
      @kind = FactoryBot.create(:kind)
      put "#{@base_url}/#{@kind.id}", params: {
        name: @kind.name,
        description: @kind.description
      }
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(201)
    end

    it 'returns Kind name' do
      expect(JSON.parse(response.body)['name']).to eq @kind.name
    end

    it 'returns Kind description' do
      expect(JSON.parse(response.body)['description']).to eq @kind.description
    end

  end

  context 'DELETE /api/v1/kinds' do

    before :all do
      @kindie = create(:kind)
      delete "#{@base_url}/#{@kindie.id}"
    end

    it 'return HTTP success' do
      expect(response).to have_http_status(204)
    end

  end

end