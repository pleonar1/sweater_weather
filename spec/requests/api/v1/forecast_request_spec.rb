require 'rails_helper'

RSpec.describe 'forecast request', type: :request do
  it "returns a sucessful response" do
    get '/api/v1/forcasts?location=chicago, il'

    expect(response).to be_successful
    
  end


end
