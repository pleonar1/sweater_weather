require 'rails_helper'

RSpec.describe YelpService, type: :service do


  it "gets a response" do
    response = YelpService.get_yelp('denver')

    expect(response).to eq([])
  end
end
