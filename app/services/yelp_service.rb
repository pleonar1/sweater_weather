class YelpService < ApplicationService
  class << self
    def connection
      Faraday.new(url: 'https://api.yelp.com/v3/') do |faraday|
        faraday.params['Authorization'] = ENV['yelp_api']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_yelp(location)
      response = connection.get("businesses/search?#{location}")
    end
  end
end
