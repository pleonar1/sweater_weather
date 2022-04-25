require 'rails_helper'

RSpec.describe ForecastService, type: :service do

  before do

  end

  it "can get the weather" do
    weather = ForecastService.get_weather('chicago, il')



  end
end
