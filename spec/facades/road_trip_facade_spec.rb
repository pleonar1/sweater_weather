require 'rails_helper'

RSpec.describe RoadTripFacade, type: :facade do
  it "creates roadtrip objects" do
    response = RoadTripFacade.get_travel_info("moultrie, ga", "thomasville, ga")
    expect(response).to be_a RoadTrip
    expect(response.end_point).to be_a String
    expect(response.end_point).to eq("thomasville, ga")
    expect(response.start_point).to be_a String
    expect(response.start_point).to eq("moultrie, ga")
    expect(response.travel_time).to be_a String
    expect(response.travel_time).to eq("00:36:40")
    expect(response.weather_conditions).to be_a String
  end
end
