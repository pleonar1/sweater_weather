class UsersController < ApplicationController

  def create
    user = User.create(user_params)
    if user == nil || user.email == ''
      render json: { data: { message: 'Invalid Email or Password'}}, status: 404
    elsif params[:password] == params[:password_confirmation]
      user.save
      render json: UserSerializer.user_response(user), status: 201
    else
      render json: { data: { message: 'Invalid Email or Password'}}, status: 404
    end
  end

    private

    def user_params
      params.permit(:email, :password, :password_confirmation, :api_key)
    end
end
