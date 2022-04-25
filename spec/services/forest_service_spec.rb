require 'rails_helper'

RSpec.describe ForecastService, type: :service do
#   it 'builds a url' do
#     base = 'https://api.openweathermap.org/data/2.5/onecall?'
#     location = "lat=40.609102&lon=-105.13186&"
#     options = 'exclude=minutely&units=imperial&'
#     key = "appid=#{ENV['open_weather_api']}"
#
#     expected = [base, location, options, key].join
#
#     expect(ForecastService.get_weather('chicago, il')).to eq expected
#
#   end
#
#   before do
#     # @url = ForecastService.get_weather('40.609102', '-105.13186')
#
#     # response = File.read('spec/fixtures/forecasts/good_response.json')
#     #
#     # stub_request(:get, @url).to_return(status: 200, body: response)
#   end
#
#   xit "gets a 200 response" do
#     response = ForecastService.send_request(@url)
#
#     expect(response.status).to eq 200
#   end
#
#   xit "returns data for a forecast" do
#     response = ForecastService.get_forecast('40.609102', '-105.13186')
#
#     expect(response[:timezone_offset]).to eq(-21600)
#
#     current = response[:current]
#     expect(current[:dt]).to eq(1650764315)
#     expect(current[:weather][0][:description]).to eq("overcast clouds")
#     expect(current[:feels_like]).to eq(44.49)
#     expect(current[:humidity]).to eq(33)
#     expect(current[:weather][0][:icon]).to eq("04d")
#     expect(current[:sunrise]).to eq(1650715789)
#     expect(current[:sunset]).to eq(1650764847)
#     expect(current[:temp]).to eq(49.69)
#     expect(current[:uvi]).to eq(0)
#     expect(current[:visibility]).to eq(10000)
#
#     hours = response[:hourly]
#     expect(hours.count).to eq(48)
#
#     hour = hours[0]
#     expect(hour[:dt]).to eq 1650762000
#     expect(hour[:temp]).to eq 49.53
#     expect(hour[:weather][0][:icon]).to eq "04d"
#
#     days = response[:daily]
#     expect(days.count).to eq 8
#
#     day = days[0]
#     expect(day[:dt]).to eq 1650736800
#     expect(day[:pop]).to eq 0.39
#     expect(day[:rain]).to eq 0.14
#     expect(day[:snow]).to eq nil
#     expect(day[:temp][:min]).to eq 45.32
#     expect(day[:temp][:max]).to eq 54.54
#     expect(day[:weather][0][:icon]).to eq "10d"
#     expect(day[:weather][0][:description]).to eq "light rain"
#   end

end
