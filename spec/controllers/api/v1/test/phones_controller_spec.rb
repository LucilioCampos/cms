require 'rails_helper'

describe 'PhonesControllerTest', type: :request do

  before :all do
    @base_url = '/api/v1/phones'
  end

  context 'When get phones with users' do
    
    before :all do
      create_list(:phone_with_user, 5)
      get @base_url
      resp = JSON.parse(response.body)
      @users = resp.select { |user| user['user_id'] != nil }
    end

    it 'returns HTTP response 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns 10 phones with users' do
      expect(@users.size).to be 5
      expect(@users[0]['client_id']).to be nil
    end

    context 'When get phones with clients' do
      
      before :all do
        create_list(:phone_with_client, 5)
        get @base_url
        resp = JSON.parse(response.body)
        @client = resp.select { |user| user['client_id'] != nil }
      end

      it 'returns HTTP response 200' do
        expect(response).to have_http_status(200)
      end
  
      it 'returns 5 phones with users' do
        expect(@client.size).to be 5
        expect(@client[0]['user_id']).to be nil
      end
    end

    describe 'POST /api/phones', type: :request do

      context 'When get phones without user or client' do
      
        before :all do
          @phone = create(:phone)
          get "#{@base_url}/#{@phone.id}"
        end
  
        it 'returns HTTP 200 status' do
          expect(response).to have_http_status(200)
        end
  
        it 'returns a phone without user' do
          expect(JSON.parse(response.body)['user_id']).to be nil
        end
  
        it 'returns a phone with user' do
          expect(JSON.parse(response.body)['client_id']).to be nil
        end
  
      end
  
      context 'When get Phones with user' do
        
        before :all do
          @w_user = create(:phone_with_user)
          get "#{@base_url}/#{@w_user.id}"
        end
  
        it 'returns HTTP 200 status' do
          expect(response).to have_http_status(200)
        end
  
        it 'returns a user_id' do
          expect(JSON.parse(response.body)['user_id']).to be > 1
        end
  
        it 'should not returns a client_id' do
          expect(JSON.parse(response.body)['client_id']).to be nil
        end
      end
  
      context 'When get a phone with client_id' do
        
        before :all do
          @w_client = create(:phone_with_client)
          get "#{@base_url}/#{@w_client.id}"
        end
  
        it 'returns HTTP status 200' do
          expect(response).to have_http_status(200)
        end
  
        it 'returns a client_id' do
          expect(JSON.parse(response.body)['client_id']).to be > 1
        end
  
        it 'should not returns a user_id' do
          expect(JSON.parse(response.body)['user_id']).to be nil
        end
  
      end
      
      context 'when post phone with user_id' do
        
        before :all do
          @user_phone = build(:phone_with_user)
          post "#{@base_url}", params: @user_phone.attributes
        end

        it 'responds with status 201' do
          expect(response).to have_http_status(201)
        end

        it 'shows correctly kind' do
          expect(JSON.parse(response.body)['kind']).to eq @user_phone.kind
        end

        it 'show correctly user_id' do
          expect(JSON.parse(response.body)['user_id']).to eq @user_phone.user_id
        end

        it 'client_id should be nil' do
          expect(JSON.parse(response.body)['client_id']).to be nil
        end

        it 'shows correctly num' do
          expect(JSON.parse(response.body)['num']).to eq @user_phone.num
        end

      end
      
    end
  
    describe 'PUT /api/v1/phones', type: :request do
      
      context 'When put a phone without user and client' do
        
        before :all do
          @phones = create(:phone)
          @new_phone = build(:phone)
          put "#{@base_url}/#{@phones.id}", params: @new_phone.attributes
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
          put "#{@base_url}/#{@phones.id}", params: @new_phone.attributes
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

      context 'When put a phone with user' do
        
        before :all do
          @phones = create(:phone)
          @new_phone = build(:phone_with_client)
          put "#{@base_url}/#{@phones.id}", params: @new_phone.attributes
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

    describe 'DELETE /api/v1/phones' do
      
      context 'When delete a phone' do
        
        before :all do
          @delete = create(:phone)
          delete "#{@base_url}/#{@delete.id}"
        end

        it 'returns a HTTP status 204' do
          expect(response).to have_http_status(204)
        end

      end

      context 'When delete a phone with user' do
        
        before :all do
          @delete =  create(:phone_with_user)
          delete "#{@base_url}/#{@delete.id}"
        end

        it 'returns a HTTP status 204' do
          expect(response).to have_http_status(204)
        end

      end

      context 'When delete a phone with client' do
        
        before :all do
          @delete =  create(:phone_with_client)
          delete "#{@base_url}/#{@delete.id}"
        end

        it 'returns a HTTP status 204' do
          expect(response).to have_http_status(204)
        end

      end

    end

  end
end