class YelpRestaurant
  attr_reader :name, :address

  def initialize(data)
    restaurant = data[:businesses][0]
    @name = restaurant[:name]
    city = restaurant[:location][:city]
    state = restaurant[:location][:state]
    city_state = (city + ", " + state)
    street_address = restaurant[:location][:address1]
    zip_code = restaurant[:location][:zip_code]
    @address = (street_address + city_state + " " + zip_code)
  end


end
