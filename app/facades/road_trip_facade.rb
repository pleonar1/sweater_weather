class RoadTripFacade

  def self.get_travel_info(start, end_point)
    location_data = LocationService.get_travel_time(start, end_point)
    weather_data = ForecastService.get_weather(end_point)
    RoadTrip.new(location_data, weather_data, start, end_point)
  end
end
