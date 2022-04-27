class ForecastService < ApplicationService
  class << self
    def connection
      Faraday.new(url: 'https://api.openweathermap.org/data/2.5/')
    end
    
    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_weather(location)
      data = LocationService.get_location(location)
      coordinates = data[:results][0][:locations][0][:latLng]
      response = connection.get('onecall') do |faraday|
        faraday.params['lat'] = coordinates[:lat]
        faraday.params['lon'] = coordinates[:lng]
        faraday.params['units'] = 'imperial'
        faraday.params['appid'] = ENV['open_weather_api']
      end
      parse_json(response)
    end
  end
end
