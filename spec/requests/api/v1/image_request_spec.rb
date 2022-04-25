require 'rails_helper'

RSpec.describe 'Image Request', type: :request do
  before do
    url = ImageService.build_url('chicago, il')
    image_response = File.read('spec/fixtures/images/good_response.json')
    stub_request(:get, url).to_return(status: 200, body: image_response)
  end

  it "returns a sucessful response" do
    get '/api/v1/images?location=chicago, il'

    expect(response).to be_successful
    expect(response.status).to eq 200

    result = JSON.parse(response.body, symbolize_names: true)
  end
end
