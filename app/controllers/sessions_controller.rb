class SessionsController < ApplicationController

    def destroy
        session.delete :user_id

        redirect_to '/'
    end

    def new
        @user = User.new
        render layout: "welcome"
    end

    def create 
        @user = User.find_by(username: params[:user][:username])

        if @user.authenticate(params[:user][:password]) 
            session[:user_id] = @user.id

            redirect_to '/'
        else
            flash[:alert] = "Could not authenticate your account"
            render :new
        end
    end

end