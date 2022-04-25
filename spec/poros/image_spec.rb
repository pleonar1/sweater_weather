require 'rails_helper'

RSpec.describe Image, type: :poro do
  before do
    response = File.read("spec/fixtures/images/good_response.json")
    body = JSON.parse(response, symbolize_names: true)

    @image = Image.new(body)
  end

  it "has attributes and source data" do
    expect(@image.url).to eq("https://images.unsplash.com/photo-1602276506752-cec706667215?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMjIxNjF8MHwxfHNlYXJjaHwxfHxjaGljYWdvJTJDJTIwaWx8ZW58MHx8fHwxNjUwNzU3Njc2&ixlib=rb-1.2.1&q=85")
    expect(@image.description).to eq("white concrete building during daytime")

    expect(@image.source_name).to eq("Dylan LaPierre")
    expect(@image.source_url).to eq("https://unsplash.com/@drench777")
    expect(@image.source_photo).to eq('https://unsplash.com/blog/content/images/max/2560/1-VnKoValwGK3-d1bZhD6sVA.jpeg')
  end
end
