class MunchieSerializer

  def self.food_data(destination, travel, weather, yelp)
    {
      "data": {
        "id": "null",
        "type": "munchie",
        "attributes": {
          "destination_city": destination,
          "travel_time": travel,
          "forecast": {
            "summary": weather[:weather][0][:description],
            "temp": weather[:temp]
          },
          "restaurant": {
            "name": yelp.name,
            "address": yelp.address
          }
        }
      }
    }
  end
end
