require 'rails_helper'

describe Api::V1::UsersController, type: :request do
  
  context 'When updates a user' do
    
    before :all do
      @old_user = create(:user)
      @new_user = build(:user)
      put "/api/v1/users/#{@old_user.id}", params: @new_user.attributes
    end

    it 'returns HTTP success' do
      expect(response.status).to eq(202)
    end

    it 'returns a resource size' do
      expect(JSON.parse(response.body).size).to be > 1
    end

    it 'returns a resource name' do
      expect(JSON.parse(response.body)['name']).to eq @new_user.name
    end

    it 'returns a resource status' do
      expect(JSON.parse(response.body)['status']).to eq @new_user.status
    end

    it 'returns a resource kind' do
      expect(JSON.parse(response.body)['kind']).to eq @new_user.kind
    end

    it 'returns a resource notes' do
      expect(JSON.parse(response.body)['notes']).to eq @new_user.notes
    end

    it 'returns a resource phone' do
      expect(JSON.parse(response.body)['phones']).to eq @new_user.phones
    end

  end
end