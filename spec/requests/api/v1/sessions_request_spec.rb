require 'rails_helper'

RSpec.describe 'session request', type: :request do

  it "returns json in correct format" do
    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
              }
    user_params_1 = {
      email: "paul@gmail.com",
      password: 'newpassword',
      password_confirmation: 'newpassword'
    }.to_json

   post '/api/v1/users', headers: headers, params: user_params_1

   login_data = {
     email: 'paul@gmail.com',
     password: 'newpassword'
   }.to_json

    post '/api/v1/sessions', headers: headers, params: login_data

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end

  it "if improper credentials, returns a invalid response" do
    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
              }
    user_params_1 = {
      email: "paul@gmail.com",
      password: 'newpassword',
      password_confirmation: 'newpassword'
    }.to_json

   post '/api/v1/users', headers: headers, params: user_params_1

   login_data = {
     email: 'pau@gmail.com',
     password: 'newpassword'
   }.to_json

    post '/api/v1/sessions', headers: headers, params: login_data

    expect(response).to be_successful
  end



end
