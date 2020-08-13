class UsersController < ApplicationController

    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id

            redirect_to user_path(@user)
        else
            redirect_to new_user_path
        end
    end

    def show 
        @user = current_user
        @goals = current_user.goals

        redirect_to '/' unless params[:id].to_i == current_user.id
    end


    private 

    def user_params 
        params.require(:user).permit(:name, :username, :password, :password_confirmation, :password_digest)
    end

end
