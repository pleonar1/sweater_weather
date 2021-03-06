require 'rails_helper'

RSpec.describe 'Create User', type: :request do

  before :each do
   # corrent input
   @user_params_1 = {
     email: Faker::Internet.email,
     password: 'newpassword',
     password_confirmation: 'newpassword'
   }.to_json

   # passwords not matching
   @user_params_2 = {
     email: Faker::Internet.email,
     password: 'password',
     password_confirmation: 'paSS'
   }.to_json

   # email not given
   @user_params_3 = {
     email: '',
     password: 'password',
     password_confirmation: 'password'
   }.to_json

   @headers = {
     'CONTENT_TYPE' => 'application/json',
     'ACCEPT' => 'application/json'
   }
 end
  it 'creates a user and posts to database' do

    post '/api/v1/users', headers: @headers, params: @user_params_1

    expect(response).to be_successful
    expect(response.status).to eq(201)

    user_json = JSON.parse(response.body, symbolize_names: true)

    expect(user_json).to have_key(:data)
    expect(user_json[:data]).to have_key(:type)
    expect(user_json[:data]).to have_key(:id)
    expect(user_json[:data]).to have_key(:attributes)
    expect(user_json[:data][:attributes]).to have_key(:email)
    expect(user_json[:data][:attributes]).to have_key(:api_key)
    expect(user_json[:data][:attributes][:api_key]).to be_a String
  end

  it "returns 400 if the passwords don't match" do
    post '/api/v1/users', headers: @headers, params: @user_params_2

    expect(response.status).to eq(400)

    user_json = JSON.parse(response.body, symbolize_names: true)

    expect(user_json).to eq({:message=>"Invalid Email or Password"})
  end

  it "returns 400 if user is blank or nil" do
    post '/api/v1/users', headers: @headers, params: @user_params_3

    expect(response.status).to eq(400)

    user_json = JSON.parse(response.body, symbolize_names: true)

    expect(user_json).to eq({:message=>"Invalid Email or Password"})
  end

  it "returns 400 and says email already exists if it does" do
    post '/api/v1/users', headers: @headers, params: @user_params_1
    post '/api/v1/users', headers: @headers, params: @user_params_1

    expect(response.status).to eq(400)

    user_json = JSON.parse(response.body, symbolize_names: true)

    expect(user_json).to eq({:message=>"Email already exists"})
  end
end
