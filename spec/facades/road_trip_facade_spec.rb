require 'rails_helper'

RSpec.describe RoadTripFacade, type: :facade do
  it "creates roadtrip objects" do
    response = RoadTripFacade.get_travel_info("moultrie, ga", "thomasville, ga")
    # require "pry"; binding.pry
  end

end
