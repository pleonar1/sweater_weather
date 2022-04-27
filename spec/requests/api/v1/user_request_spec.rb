require 'rails_helper'

RSpec.describe 'Create User', type: :request do
 # 
 #  before :each do
 #   # corrent input
 #   @user_params_1 = {
 #     email: Faker::Internet.email,
 #     password: 'newpassword',
 #     password_confirmation: 'newpassword'
 #   }.to_json
 #
 #   # passwords not matching
 #   @user_params_2 = {
 #     email: Faker::Internet.email,
 #     password: 'password',
 #     password_confirmation: 'paSS'
 #   }.to_json
 #
 #   # email not given
 #   @user_params_3 = {
 #     email: '',
 #     password: 'password',
 #     password_confirmation: 'password'
 #   }.to_json
 #
 #   # not json
 #   @user_params_4 = {
 #     email: Faker::Internet.email,
 #     password: 'password',
 #     password_confirmation: 'password'
 #   }
 #
 #   @headers = {
 #     'CONTENT_TYPE' => 'application/json',
 #     'ACCEPT' => 'application/json'
 #   }
 # end
  it 'creates a user and posts to database' do
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    params = {
      "email": "paul@email.com",
      "password": "realpassword",
      "password_confirmation": "realpassword"
    }

    post '/api/v1/users', headers: headers, params: params
  end



end
