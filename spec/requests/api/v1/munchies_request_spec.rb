require 'rails_helper'

RSpec.describe 'Munchies Request', type: :request do

  it "returns a sucessful response" do
    get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food=chinese'
    json_data = JSON.parse(response.body, symbolize_names: true)
    # require "pry"; binding.pry
    expect(json_data).to have_key(:data)
    expect(json_data[:data]).to have_key(:id)
    expect(json_data[:data]).to have_key(:type)
    expect(json_data[:data]).to have_key(:attributes)
    expect(json_data[:data][:attributes]).to have_key(:destination_city)
    expect(json_data[:data][:attributes]).to have_key(:travel_time)
    expect(json_data[:data][:attributes]).to have_key(:forecast)
    expect(json_data[:data][:attributes]).to have_key(:restaurant)
    expect(json_data[:data][:attributes][:forecast]).to have_key(:summary)
    expect(json_data[:data][:attributes][:forecast]).to have_key(:temp)
    expect(json_data[:data][:attributes][:restaurant]).to have_key(:name)
    expect(json_data[:data][:attributes][:restaurant]).to have_key(:address)
  end
end
