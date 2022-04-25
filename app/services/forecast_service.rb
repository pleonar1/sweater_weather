class ForecastService < ApplicationService
  class << self
    def connection
      Faraday.new(url: 'https://api.openweathermap.org/data/2.5/') do |faraday|
        faraday.params['appid'] = ENV['open_weather_api']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_weather(location)
      coordinates = LocationService.get_location(location)
      response = ('onecall') do |faraday|
      parse_json(response)
    end
  end
end
