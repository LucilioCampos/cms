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
      expect(JSON.parse(response.body)[0]['nome']).to be_truthy
      expect(JSON.parse(response.body)[0]['descricao']).to be_truthy
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
      @new_kind = { nome: 'Testing', descricao: 'Testing'}
      post "#{@base_url}", params: @new_kind
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(201)
    end

    it 'returns Kind name' do
      expect(JSON.parse(response.body)['nome']).to eq @new_kind['nome']
    end

    it 'returns Kind description' do
      expect(JSON.parse(response.body)['descricao']).to eq @new_kind['descricao']
    end

  end

  context 'PUT /api/v1/kinds' do

    before do
      @kind = FactoryBot.create(:random_kinds)
      put "#{@base_url}/#{@kind.id}", params: {
        nome: @name,
        descricao: @description
      }
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(201)
    end

    it 'returns Kind name' do
      expect(JSON.parse(response.body)['nome']).to eq @kind.name
    end

    it 'returns Kind description' do
      expect(JSON.parse(response.body)['descricao']).to eq @kind.description
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

    it 'return deleted kind data' do
      expect(JSON.parse(response.body)).to eq 3
      expect(JSON.parse(response.body)['id']).to eq @kind.name
      expect(JSON.parse(response.body)['nome']).to eq @kind.name
      expect(JSON.parse(response.body)['descricao']).to eq @kind.description
    end

    it 'should not return when search for user' do
      expect(Kind.last.id).to eq @kind.id
      expect(Kind.last.name).to eq @kind.name
      expect(Kind.last.description).to eq @kind.description
    end

  end

end