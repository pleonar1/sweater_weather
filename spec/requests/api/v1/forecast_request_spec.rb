require 'rails_helper'

RSpec.describe 'forecast request', type: :request do
  it "returns a sucessful response" do
    get '/api/v1/forcasts?location=chicago, il'
  end


end
