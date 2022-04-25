require 'rails_helper'

RSpec.describe ForecastService, type: :service do

  before do


    # response = File.read('spec/fixtures/forecasts/good_response.json')
    #
    # stub_request(:get, @url).to_return(status: 200, body: response)
  end

  xit "can get the weather" do
    weather = ForecastService.get_weather('chicago, il')

    require "pry"; binding.pry

  end
end
