require 'rails_helper'

RSpec.describe YelpFacade, type: :facade do
  it "Makes yelp restaurant objects" do
    response = YelpFacade.get_yelp('chinese', 'denver')
    expect(response).to be_a YelpRestaurant
    expect(response.name).to eq("Taste of China")
    expect(response.address).to eq("1935 Federal BlvdDenver, CO 80204")
  end
end
