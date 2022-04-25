class YelpService < ApplicationService
  class << self
    def connection
      Faraday.new('https://api.yelp.com/v3/businesses/')
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_yelp(location)
      
    end

end
