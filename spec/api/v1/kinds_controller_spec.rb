require 'rails_helper'

describe 'KindsController', type: :request do
  let!(:kinds) { FactoryBot.create_list(:random_kinds, 10) }
  before :all do
    @base_url = '/api/v1/kinds'
  end

  context 'GET /Kinds', type: :request do
    
    before do
      get @base_url
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq 10
      puts JSON.parse(response.body)[0]
      expect(JSON.parse(response.body)[0]['id']).to be_truthy
      expect(JSON.parse(response.body)[0]['name']).to be_truthy
      expect(JSON.parse(response.body)[0]['description']).to be_truthy
    end
  end

  context 'GET /kinds/id', type: :request do

    before do
      get "#{@base_url}/5"
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
      @kind = FactoryBot.create(:random_kinds)
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
      @kind = Kind.last
      delete "#{@base_url}/#{@kind.id}"
    end

    it 'return HTTP success' do
      expect(response).to have_http_status(204)
    end

    it 'should not return when search for user' do
      expect(Kind.last.id).to_not eq @kind.id
      expect(Kind.last.name).to_not eq @kind.name
      expect(Kind.last.description).to_not eq @kind.description
    end

  end

end