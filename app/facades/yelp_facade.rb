class YelpFacade


  def self.get_yelp(food_type, location)
    response = YelpService.get_yelp(food_type, location)
    response[:businesses][0] = YelpRestaurant.new(response)
  end
end
