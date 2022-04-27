require 'rails_helper'

RSpec.describe 'road trip request', type: :request do
  before do
    @user = User.create(email: "paullll@gmail.com", password: "password", password_confirmation: "password")

    @headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

    # @request_body = {
    #       :or
    # }
  end







end
