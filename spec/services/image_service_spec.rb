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
end
