require 'rails_helper'

RSpec.describe 'Munchies Request', type: :request do

  it "returns a sucessful response" do
    get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food=chinese'

    # expect(response).to be_succesful
    json_data = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
  end
end
