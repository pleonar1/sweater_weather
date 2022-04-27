class YelpService < ApplicationService
  class << self
    def connection
      Faraday.new(url: 'https://api.yelp.com/v3/') do |faraday|
        faraday.headers['Authorization'] = ENV['yelp_api']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_yelp(food_type, location)
      response = connection.get('businesses/search') do |faraday|
        faraday.params['term'] = food_type
        faraday.params['location'] = location
      end
      parse_json(response)
    end
  end
end
