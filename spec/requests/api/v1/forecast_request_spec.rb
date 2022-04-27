require 'rails_helper'

RSpec.describe 'forecast request', type: :request do
  it "returns a sucessful response, with the correct format" do
    get '/api/v1/forcasts?location=chicago, il'
    #the ones commented out can be float or integer
    expect(response).to be_successful
    forecast_json = JSON.parse(response.body, symbolize_names: true)
    expect(forecast_json).to be_a Hash
    expect(forecast_json[:data]).to include(:id)
    expect(forecast_json[:data]).to include(:type)
    expect(forecast_json[:data][:type]).to eq("forecast")
    expect(forecast_json[:data]).to include(:attributes)
    expect(forecast_json[:data][:attributes]).to include(:current_weather)
    expect(forecast_json[:data][:attributes][:current_weather]).to include(:datetime)
    expect(forecast_json[:data][:attributes][:current_weather][:datetime]).to be_a String
    expect(forecast_json[:data][:attributes][:current_weather]).to include(:temperature)
    # expect(forecast_json[:data][:attributes][:current_weather][:temperature]).to be_a Float
    expect(forecast_json[:data][:attributes][:current_weather]).to include(:sunrise)
    expect(forecast_json[:data][:attributes][:current_weather][:sunrise]).to be_a String
    expect(forecast_json[:data][:attributes][:current_weather]).to include(:sunset)
    expect(forecast_json[:data][:attributes][:current_weather][:sunset]).to be_a String
    expect(forecast_json[:data][:attributes][:current_weather]).to include(:feels_like)
    expect(forecast_json[:data][:attributes][:current_weather][:feels_like]).to be_a Float
    expect(forecast_json[:data][:attributes][:current_weather]).to include(:humidity)
    expect(forecast_json[:data][:attributes][:current_weather][:humidity]).to be_a Integer
    expect(forecast_json[:data][:attributes][:current_weather]).to include(:uvi)
    expect(forecast_json[:data][:attributes][:current_weather][:uvi]).to be_a Integer
    expect(forecast_json[:data][:attributes][:current_weather]).to include(:visibility)
    expect(forecast_json[:data][:attributes][:current_weather][:visibility]).to be_a Integer
    expect(forecast_json[:data][:attributes][:current_weather]).to include(:condition)
    expect(forecast_json[:data][:attributes][:current_weather][:condition]).to be_a String
    expect(forecast_json[:data][:attributes][:current_weather]).to include(:icon)
    expect(forecast_json[:data][:attributes][:current_weather][:icon]).to be_a String

    expect(forecast_json[:data][:attributes][:daily_weather]).to be_an Array

    forecast_json[:data][:attributes][:daily_weather].each do |hash|
      expect(hash).to include(:date)
      expect(hash[:date]).to be_a String
      expect(hash).to include(:sunrise)
      expect(hash[:sunrise]).to be_a String
      expect(hash).to include(:sunset)
      expect(hash[:sunset]).to be_a String
      expect(hash).to include(:max_temp)
      # expect(hash[:max_temp]).to be_a Float
      expect(hash).to include(:min_temp)
      # expect(hash[:min_temp]).to be_a Float
      expect(hash).to include(:condition)
      expect(hash[:condition]).to be_a String
      expect(hash).to include(:icon)
      expect(hash[:icon]).to be_a String
    end

    expect(forecast_json[:data][:attributes][:hourly_weather]).to be_an Array
    expect(forecast_json[:data][:attributes][:hourly_weather].length).to eq(8)

    forecast_json[:data][:attributes][:hourly_weather].each do |hash|
      expect(hash).to include(:time)
      expect(hash[:time]).to be_a String
      expect(hash).to include(:temp)
      # expect(hash[:temp]).to be_a Float
      expect(hash).to include(:condition)
      expect(hash[:condition]).to be_a String
      expect(hash).to include(:icon)
      expect(hash[:icon]).to be_a String
    end
  end

  it "returns a 404 and message if location is not provided in request" do
    get '/api/v1/forcasts?location='

    expect(response.status).to eq(404)

    forecast_json = JSON.parse(response.body, symbolize_names: true)
    expect(forecast_json).to eq({:data=>{:message=>"location must be provided"}})
  end
end
