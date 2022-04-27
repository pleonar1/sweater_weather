class UsersController < ApplicationController

  def create
   user = User.new(user_params)
   if params[:password] != params[:password_confirmation]
     render json: { message: "Invalid Email or Password" }, status: 400
   elsif User.find_by(email: user[:email]).present?
     render json: { message: "Email already exists" }, status: 400
   elsif user == nil || user.email == ''
     render json: { message: 'Invalid Email or Password'}, status: 400
   else
     user.save
     render json: UserSerializer.user_response(user), status: 201
   end
 end


    private

    def user_params
      params.permit(:email, :password, :password_confirmation, :api_key)
    end
end
