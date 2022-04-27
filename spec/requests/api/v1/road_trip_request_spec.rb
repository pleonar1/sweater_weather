require 'rails_helper'

RSpec.describe 'road trip request', type: :request do
  before do
    @user = User.create(email: "paullll@gmail.com", password: "password", password_confirmation: "password")

    @headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

    @params = {
      origin: 'moultrie, ga',
      destination: 'thomasville, ga',
      api_key: @user.api_key
    }.to_json
  end

  it "responds with roadtrip json when given API key" do
    post '/api/v1/road_trip', headers: @headers, params: @params
    road_trip_json = JSON.parse(response.body, symbolize_names: true)

    expect(road_trip_json).to be_a Hash
    expect(road_trip_json).to include(:data)
    expect(road_trip_json[:data]).to include(:id)
    expect(road_trip_json[:data][:id]).to eq("null")
    expect(road_trip_json[:data]).to include(:type)
    expect(road_trip_json[:data][:type]).to eq("roadtrip")
    expect(road_trip_json[:data]).to include(:attributes)
    expect(road_trip_json[:data][:attributes]).to include(:start_city)
    expect(road_trip_json[:data][:attributes][:start_city]).to be_a String
    expect(road_trip_json[:data][:attributes]).to include(:end_city)
    expect(road_trip_json[:data][:attributes][:end_city]).to be_a String
    expect(road_trip_json[:data][:attributes]).to include(:travel_time)
    expect(road_trip_json[:data][:attributes][:travel_time]).to be_a String
    expect(road_trip_json[:data][:attributes]).to include(:weather_at_eta)
    expect(road_trip_json[:data][:attributes][:weather_at_eta]).to include(:temperature)
    expect(road_trip_json[:data][:attributes][:weather_at_eta]).to include(:conditions)
    expect(road_trip_json[:data][:attributes][:weather_at_eta][:conditions]).to be_a String
  end

  it "returns an error for bad api key" do
    bad_params = {
      origin: 'moultrie, ga',
      destination: 'thomasville, ga',
      api_key: "nonsense"
    }.to_json
    post '/api/v1/road_trip', headers: @headers, params: bad_params

    expect(response.status).to eq(400)
    road_trip_json = JSON.parse(response.body, symbolize_names: true)

    expect(road_trip_json).to eq({:message=>"API key INVALID"})
  end

  it "returns a json response that declare the trip impossible if it is" do
    bad_params = {
      origin: 'moultrie, ga',
      destination: 'london',
      api_key: @user.api_key
    }.to_json
    post '/api/v1/road_trip', headers: @headers, params: bad_params

    road_trip_json = JSON.parse(response.body, symbolize_names: true)

    expect(road_trip_json).to be_a Hash
    expect(road_trip_json[:data][:attributes][:start_city]).to eq('moultrie, ga')
    expect(road_trip_json[:data][:attributes][:end_city]).to eq('london')
    expect(road_trip_json[:data][:attributes][:travel_time]).to eq('impossible')
    expect(road_trip_json[:data][:attributes][:weather_at_eta]).to eq('null')
  end





end
