require 'rails_helper'

RSpec.describe YelpService, type: :service do


  it "gets a response that returns the city, the name and address of the restaurant" do
    response = YelpService.get_yelp('chinese', 'denver')

    expect(response[:businesses][0][:name]).to eq("Taste of China")
    expect(response[:businesses][0][:coordinates]).to eq({:latitude=>39.74702, :longitude=>-105.02571})
    expect(response[:businesses][0][:location][:address1]).to eq("1935 Federal Blvd")
    expect(response[:businesses][0][:location][:city]).to eq("Denver")
    expect(response[:businesses][0][:location][:zip_code]).to eq("80204")
    expect(response[:businesses][0][:distance]).to eq(4901.717617542795)
    expect(response[:businesses][0][:categories][0][:alias]).to eq('chinese')
  end
end
