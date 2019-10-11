require 'rails_helper'

describe Api::V1::UsersController, type: :request do
  
  context 'DELETE /api/v1/users' do
    
    before :all do
      @delete_user = create(:user)
      delete "/api/v1/users/#{@delete_user.id}"
    end

    it 'returns HTTP success' do
      expect(response).to have_http_status(204)
    end

  end
end