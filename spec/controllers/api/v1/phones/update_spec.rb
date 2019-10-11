require 'rails_helper'

describe Api::V1::PhonesController, type: :request do
  
  describe 'PUT /api/v1/phones', type: :request do
      
    context 'When put a phone without user and client' do
      
      before :all do
        @phones = create(:phone)
        @new_phone = build(:phone)
        put "/api/v1/phones/#{@phones.id}", params: @new_phone.attributes
      end

      it 'returns HTTP status 201' do
        expect(response).to have_http_status(202)
      end

      it 'returns an user_id nil' do
        expect(JSON.parse(response.body)['user_id']).to be nil
      end

      it 'returns a client_id nil' do
        expect(JSON.parse(response.body)['client_id']).to be nil
      end

      it 'returns a new phone kind' do
        expect(JSON.parse(response.body)['kind']).to eq @new_phone.kind
      end

      it 'returns a new phone num' do
        expect(JSON.parse(response.body)['num']).to eq @new_phone.num
      end

    end

    context 'When put a phone with user' do
      
      before :all do
        @phones = create(:phone)
        @new_phone = build(:phone_with_user)
        put "/api/v1/phones/#{@phones.id}", params: @new_phone.attributes
      end

      it 'returns HTTP status 201' do
        expect(response).to have_http_status(202)
      end

      it 'returns an new user_id' do
        expect(JSON.parse(response.body)['user_id']).to eq @new_phone.user_id
      end

      it 'returns a client_id nil' do
        expect(JSON.parse(response.body)['client_id']).to be nil
      end

      it 'returns a new phone kind' do
        expect(JSON.parse(response.body)['kind']).to eq @new_phone.kind
      end

      it 'returns a new phone num' do
        expect(JSON.parse(response.body)['num']).to eq @new_phone.num
      end

    end

    context 'When put a phone with client' do
      
      before :all do
        @phones = create(:phone)
        @new_phone = build(:phone_with_client)
        put "/api/v1/phones/#{@phones.id}", params: @new_phone.attributes
      end

      it 'returns HTTP status 201' do
        expect(response).to have_http_status(202)
      end

      it 'returns an user_id nil' do
        expect(JSON.parse(response.body)['user_id']).to be nil
      end

      it 'returns a new client_id' do
        expect(JSON.parse(response.body)['client_id']).to eq @new_phone.client_id
      end

      it 'returns a new phone kind' do
        expect(JSON.parse(response.body)['kind']).to eq @new_phone.kind
      end

      it 'returns a new phone num' do
        expect(JSON.parse(response.body)['num']).to eq @new_phone.num
      end

    end

  end
end