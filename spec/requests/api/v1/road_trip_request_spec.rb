require 'rails_helper'

RSpec.describe 'road trip request', type: :request do
  before do
    @user = User.create(email: "paullll@gmail.com", password: "password", password_confirmation: "password")

    @headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

    @params = {
      start: 'moultrie, ga',
      end_point: 'thomasville, ga',
      api_key: @user.api_key
    }.to_json
  end

  it "responds with roadtrip json when given API key" do
    post '/api/v1/road_trip', headers: @headers, params: @params
  end






end
