require 'rails_helper'

RSpec.describe ImageSerializer, type: :serializer do
  before do
    response_body = File.read("spec/fixtures/images/good_response.json")
    body = JSON.parse(response_body, symbolize_names: true)
    @image_poro = Image.new(body)
  end
  it "converts poro to json object" do
    output = ImageSerializer.format_data(@image_poro)

    image_data = output[:data][:image]
    expect(image_data[:url]).to eq "https://images.unsplash.com/photo-1602276506752-cec706667215?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMjIxNjF8MHwxfHNlYXJjaHwxfHxjaGljYWdvJTJDJTIwaWx8ZW58MHx8fHwxNjUwNzU3Njc2&ixlib=rb-1.2.1&q=85"
    expect(image_data[:description]).to eq "white concrete building during daytime"

    credit_data = output[:data][:credits]
    expect(credit_data[:source_name]).to eq "Dylan LaPierre"
    expect(credit_data[:source_url]).to eq "https://unsplash.com/@drench777"
    expect(credit_data[:source_photo]).to eq "https://unsplash.com/blog/content/images/max/2560/1-VnKoValwGK3-d1bZhD6sVA.jpeg"
  end
end
