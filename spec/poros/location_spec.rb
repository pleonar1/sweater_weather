require 'rails_helper'

RSpec.describe Location, type: :poro do
  before do
    response = File.read('spec/fixtures/locations/good_response.json')
    body = JSON.parse(response, symbolize_names: true)
    results = body[:results][0][:locations][0]

    @location = Location.new(results)
  end

  it 'has city, state and country' do
    expect(@location.city).to eq "Chicago"
    expect(@location.state).to eq "IL"
    expect(@location.country).to eq "US"
  end

  it 'has coordinates' do
  expect(@location.latitude).to eq 41.883229
  expect(@location.longitude).to eq -87.632398
  end
end
