class UsersController < ApplicationController

  def create
    if params[:password] == params[:password_confirmation]
      user = User.create(user_params)
      render json: UserSerializer.user_response(user), status: 201
    else
      render status: 404
      render json: { data: { message: 'Invalid Email or Password'}}
    end
  end

    private

    def user_params
      params.permit(:email, :password, :password_confirmation, :api_key)
    end
end
