require 'rails_helper'

RSpec.describe ImageService, type: :service do

  before do
    base = 'https://api.unsplash.com/search/photos?'
    key = "client_id=#{ENV['unsplash_api']}&"
    options = 'order_by=relevant&page=1&per_page=1&'
    query = "query=chicago, il"

    @expected = [base, key, options, query].join
  end

  it 'builds a url' do
    base = 'https://api.unsplash.com/search/photos?'
    key = "client_id=#{ENV['unsplash_api']}&"
    options = 'order_by=relevant&page=1&per_page=1&'
    query = "query=chicago, il"

    expected = [base, key, options, query].join
    expect(ImageService.build_url('chicago, il')).to eq expected
  end

  it "recieves a 200 response" do
    base = 'https://api.unsplash.com/search/photos?'
    key = "client_id=#{ENV['unsplash_api']}&"
    options = 'order_by=relevant&page=1&per_page=1&'
    query = "query=chicago, il"

    url = [base, key, options, query].join

    response = File.read('spec/fixtures/images/good_response.json')

    stub_request(:get, url).to_return(status: 200, body: response)
    expect(response.status).to eq 200
  end

  it "returns the data for one image" do
  response = ImageService.get_image('chicago, il')

   expect(response[:total]).to_not eq 0
   expect(response[:results].count).to eq 1

   expected = response[:results][0]

   expect(expected[:urls][:full]).to eq("https://images.unsplash.com/photo-1602276506752-cec706667215?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMjI0MzN8MHwxfHNlYXJjaHwxfHxjaGljYWdvJTJDJTIwaWx8ZW58MHx8fHwxNjUwODU0NjM3&ixlib=rb-1.2.1&q=85")
   expect(expected[:alt_description]).to eq("white concrete building during daytime")

   credits = expected[:user]

   expect(credits[:name]).to eq("Jeffery Erhunse")
   expect(credits[:links][:html]).to eq("https://unsplash.com/@j_erhunse")
  end
end
