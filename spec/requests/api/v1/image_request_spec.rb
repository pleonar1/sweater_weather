require 'rails_helper'

RSpec.describe 'Image Request', type: :request do
  before do
    url = ImageService.build_url('chicago, il')
    image_response = File.read('spec/fixtures/images/good_response.json')
    stub_request(:get, url).to_return(status: 200, body: image_response)
  end

  it "returns a sucessful response in the correct format" do
    get '/api/v1/images?location=chicago, il'

    expect(response.status).to eq 200

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result).to be_a Hash
    expect(result[:data]).to include(:type)
    expect(result[:data]).to include(:image)
    expect(result[:data]).to include(:credits)

    expect(result[:data][:type]).to be_a String
    expect(result[:data][:type]).to eq("image")

    expect(result[:data][:image]).to be_a Hash
    expect(result[:data][:image]).to include(:url)
    expect(result[:data][:image][:url]).to be_a String
    expect(result[:data][:image]).to include(:description)
    expect(result[:data][:image][:description]).to be_a String

    expect(result[:data][:credits]).to be_a Hash
    expect(result[:data][:credits]).to include(:source_name)
    expect(result[:data][:credits]).to include(:source_url)
    expect(result[:data][:credits]).to include(:source_photo)
    expect(result[:data][:credits]).to include(:location)

    expect(result[:data][:credits][:source_name]).to be_a String
    expect(result[:data][:credits][:source_name]).to eq("Dylan LaPierre")
    expect(result[:data][:credits][:source_url]).to be_a String
    expect(result[:data][:credits][:source_url]).to eq("https://unsplash.com/@drench777")
    expect(result[:data][:credits][:source_photo]).to be_a String
    expect(result[:data][:credits][:source_photo]).to eq("https://unsplash.com/blog/content/images/max/2560/1-VnKoValwGK3-d1bZhD6sVA.jpeg")
    expect(result[:data][:credits][:location]).to be_a String
    expect(result[:data][:credits][:location]).to eq("Chicago ")
  end
end
