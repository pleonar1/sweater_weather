require 'rails_helper'

RSpec.describe 'Create User', type: :request do
  it 'creates a user and posts to database' do
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    params = {
      "email": "paul@email.com",
      "password": "realpassword",
      "password_confirmation": "realpassword"
    }

    # post 'api/v1/users'
  end



end
