class RoadTripSerializer

  def self.format_data(road_trip)
    {
      "data": {
        "id": "null",
        "type": "roadtrip",
        "attributes": {
          "start_city": road_trip.start_point,
          "end_city": road_trip.end_point,
          "travel_time": road_trip.travel_time,
          "weather_at_eta": {
            "temperature": road_trip.weather_temp,
            "conditions": road_trip.weather_conditions
          }
        }
      }
    }
  end

  def self.no_route(start, destination)
     {
       "data": {
         "id": "null",
         "type": "roadtrip",
         "attributes": {
           "start_city": start,
           "end_city": destination,
           "travel_time": "impossible",
           "weather_at_eta": "null"
           
         }
       }
     }
  end
end
