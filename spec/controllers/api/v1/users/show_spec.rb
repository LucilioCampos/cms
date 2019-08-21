require 'rails_helper'

describe Api::V1::UsersController, type: :request do

  context "When get a user" do
    
    before :all do
      @user = create(:user)
      get "/api/v1/users/#{@user.id}"
    end

    it 'returns HTTP response 200' do
      expect(response).to have_http_status 200
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