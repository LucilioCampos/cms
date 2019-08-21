require 'rails_helper'

describe Api::V1::UsersController, type: :request do
  
  context 'When POST a user', type: :request do

    before :all do
      @user = create(:user)
      post "/api/v1/users", params: @user.attributes
    end

    
    it 'returns HTTP success' do
      expect(response.status).to eq(201)
    end

    it 'returns a resource size' do
      expect(JSON.parse(response.body).size).to be > 1
    end

    it 'returns a resource name' do
      expect(JSON.parse(response.body)['name']).to eq @user.name
    end

    it 'returns a resource status' do
      expect(JSON.parse(response.body)['status']).to eq @user.status
    end

    it 'returns a resource kind' do
      expect(JSON.parse(response.body)['kind']).to eq @user.kind
    end

    it 'returns a resource notes' do
      expect(JSON.parse(response.body)['notes']).to eq @user.notes
    end

    it 'returns a resource phone' do
      expect(JSON.parse(response.body)['phones']).to eq @user.phones
    end
    
  end
end