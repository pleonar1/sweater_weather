require 'rails_helper'

RSpec.describe ImageService, type: :service do

  it 'builds a url' do
    base = 'https://api.unsplash.com/search/photos?'
    key = "client_id=#{ENV['unsplash_api']}&"
    options = 'order_by=relevant&page=1&per_page=1&'
    query = "query=atlanta, ga"

    expected = [base, key, options, query].join
    expect(ImageService.build_url('atlanta, ga')).to eq expected
  end

  it "recieves a 200 response" do
    base = 'https://api.unsplash.com/search/photos?'
    key = "client_id=#{ENV['unsplash_api']}&"
    options = 'order_by=relevant&page=1&per_page=1&'
    query = "query=atlanta, ga"

    url = [base, key, options, query].join

    response = ImageService.send_request(url)

    expect(response.status).to eq 200
  end

  it "returns the data for one image" do
    response = ImageService.get_image('atlanta, ga')

   expect(response[:total]).to_not eq 0
   expect(response[:results].count).to eq 1

   expected = response[:results][0]

   require "pry"; binding.pry
   expect(expected[:urls][:full]).to eq("https://images.unsplash.com/photo-1599697985689-7fad9fd0c94c?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMjI0MzN8MHwxfHNlYXJjaHwxfHxhdGxhbnRhJTJDJTIwZ2F8ZW58MHx8fHwxNjUwODUyOTI0&ixlib=rb-1.2.1&q=85")
   expect(expected[:alt_description]).to eq("woman in gray cardigan with silver necklace")

   credits = response[:user]

   expect(credits[:name]).to eq("Jeffery Erhunse")
   expect(image_credit[:links][:html]).to eq("https://unsplash.com/@j_erhunse")
  end
end
