class Api::V1::UsersController < ApplicationController
    skip_before_action :authenticate, only:[:login,:create], raise: false

    def login
        render json: { error: "User not authenticated" }, status: 401 and return unless @user = UsersServices.login(params[:email], params[:password])
        render json: @user.profile, status: :ok
    end
    
    def create
        @user = UsersServices.register(params[:email], params[:first_name], params[:last_name], params[:nickname], params[:password], params[:password_confirmation])
        render json: { error: "There was a problem saving your user" }, status: :unprocessable_entity and return unless @user
        render json: @user.profile, status: :ok
    end
    
    def logout
        render json: { error: "There was a problem logging out" }, status: :unprocessable_entity and return unless UsersServices.logout(@current_user)
        render json: { success: "You have been logged out" }, status: :ok
    end
    
    def profile
        render json: @current_user.profile, status: :ok
    end

    private

    def user_params
        params.require(:user).permit(:email, :first_name, :last_name, :nickname, :password, :password_confirmation)
    end
end
