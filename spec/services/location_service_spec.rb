require 'rails_helper'

RSpec.describe LocationService, type: :service do
  it "builds a url" do
    base = 'http://www.mapquestapi.com/geocoding/v1/address?'
    location = "location=chicago, il&"
    key = "key=#{ENV['map_quest_api']}"

    expected = [base, location, key].join

    expect(LocationService.build_url('chicago, il')).to eq expected
  end

  before do
    @url = LocationService.build_url('chicago, il')

    response = File.read('spec/fixtures/locations/good_response.json')

    stub_request(:get, @url).to_return(status: 200, body: response)
  end

  it "gets a 200 response" do
    response = LocationService.send_request(@url)
    expect(response.status).to eq 200
  end

  it 'returns location data' do
    response = LocationService.get_location('chicago, il')

    status = response[:info][:statuscode]
    expect(status).to eq 0

    results = response[:results][0][:locations][0]
    expect(results[:adminArea5]).to eq "Chicago"
    expect(results[:adminArea3]).to eq "IL"
    expect(results[:adminArea1]).to eq "US"

    coordinates = results[:latLng]

    expect(coordinates[:lat]).to eq 41.883229
    expect(coordinates[:lng]).to eq -87.632398
  end

  it "can get travel time between two cities" do
    response = LocationService.get_travel_time('denver', 'pueblo')

    expect(response[:route][:formattedTime]).to eq("01:45:23")
  end
end
