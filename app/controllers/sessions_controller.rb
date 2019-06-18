class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(name: params[:name])
   
        if  @user && @user.authenticate(params[:password])

            session[:user_id] = @user.id

            redirect_to home_path(@user)
        else
            flash[:notice] = "Wrong username/password combination"

            redirect_to login_path
        end
    end
end