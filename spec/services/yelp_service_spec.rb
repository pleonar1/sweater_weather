require 'rails_helper'

RSpec.describe YelpService, type: :service do


  it "gets a response" do
    response = YelpService.get_yelp('denver')

    expect(response).to be_successful
  end
end
