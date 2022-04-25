class ForecastService < ApplicationService

  def self.get_forecast(latitude, longitude)
    url = build_url(latitude, longitude)
    get_data(url)
  end

  def self.build_url(latitude, longitude)
    base = 'https://api.openweathermap.org/data/2.5/onecall?'
    location = "lat=#{latitude}&lon=#{longitude}&"
    options = 'exclude=minutely&units=imperial&'
    key = "appid=#{ENV['open_weather_api']}"

    [base, location, options, key].join
  end
end
