class LocationService < ApplicationService
  def self.get_location(query)
     url = build_url(query)
     get_data(url)
   end

   def self.build_url(query)
     base = 'http://www.mapquestapi.com/geocoding/v1/address?'
     location = "location=#{query}&"
     key = "key=#{ENV['map_quest_api']}"

     [base, location, key].join
   end

   def self.get_travel_time(start, end_point)
     base = "http://www.mapquestapi.com/directions/v2/route?"
     key = "key=#{ENV['map_quest_api']}&"
     from = "from=#{start}&"
     to   = "to=#{end_point}"

     url = [base, key, from, to].join
  
     get_data(url)
   end


 end
