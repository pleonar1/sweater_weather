class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email])
    if user.present?
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: UserSerializer.user_response(user), status: 200
      else
        render json: { data: { message: 'Invalid Email or Password'}}, status: 404
      end
    else
      render json: { data: { message: 'Invalid Email or Password'}}, status: 404
    end
  end
end
