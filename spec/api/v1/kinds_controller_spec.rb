require 'rails_helper'

describe 'KindsControllerTests' do
  let!(:users) { FactoryBot.create_list(:random_users, 10) }
  before do
    @base_url = '/api/v2/kinds'
  end
end