class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user != nil
      user = User.find_by(email: params[:email])
      user.authenticate(params[:password])
      render json: UserSerializer.user_response(user), status: 200
    elsif user == nil
      render json: { data: { message: 'Invalid Email or Password'}}
    end
  end


end
