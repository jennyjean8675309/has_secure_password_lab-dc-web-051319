class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
    end

    def home
        @user = User.find_by(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end