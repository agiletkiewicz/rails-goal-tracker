class SessionsController < ApplicationController

    def destroy
        session.delete :user_id

        redirect_to '/'
    end

    def new
        @user = User.new
    end

    def create 
        @user = User.find_by(username: params[:user][:username])
        session[:user_id] = @user.id

        redirect_to user_path(@user)
    end

end