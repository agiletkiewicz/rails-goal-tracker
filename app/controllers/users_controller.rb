class UsersController < ApplicationController

    def new 
        @user = User.new
        render layout: "welcome"
    end

    def create 
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id

            redirect_to '/'
        else
            render :new
        end
    end

    def show 
        if logged_in?
            @user = current_user
            @goals = @user.ordered_open_goals
            @upcoming_tasks = @user.upcoming_tasks
        else
            redirect_to '/signin'
        end
    end


    private 

    def user_params 
        params.require(:user).permit(:name, :username, :password, :password_confirmation, :password_digest)
    end

end
