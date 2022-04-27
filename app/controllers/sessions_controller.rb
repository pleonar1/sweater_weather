class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email])
    if user != nil
      user = User.find_by(email: params[:session][:email])
      user.authenticate(params[:password])
      render json: UserSerializer.user_response(user), status: 200
    elsif user == nil
      render json: { data: { message: 'Invalid Email or Password'}}, status: 404
    end
  end
end
