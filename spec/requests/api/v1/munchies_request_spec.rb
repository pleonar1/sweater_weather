require 'rails_helper'

RSpec.describe 'Munchies Request', type: :request do

  xit "returns a sucessful response" do
    get '/api/v1/munchies?start=denver,co&destination=pueblo,co&food=chinese'
  end

end
