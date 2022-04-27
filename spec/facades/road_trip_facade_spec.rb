class RoadTripFacade

  def self.get_travel_info(start, end_point)
    LocationService.get_travel_time(start, end_point)
  end
end
