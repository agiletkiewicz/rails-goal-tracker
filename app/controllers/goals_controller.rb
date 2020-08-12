class GoalsController < ApplicationController

    def new 
        @user = User.find_by(id: session[:user_id])
        @goal = Goal.new
    end

    def create
        @user = User.find_by(id: params[:user_id])
        @goal = Goal.new(goal_params)
        @goal.user = @user 
        @goal.save

        redirect_to user_goals_path
    end

    def index 
        @goals = Goal.all
    end

    def show 
        @goal = Goal.find_by(id: params[:id])
        @task= Task.new
    end

    private 

    def goal_params 
        params.require(:goal).permit(:description, :key_result, :by_when, :nickname, :category_id, :user_id)
    end
end
