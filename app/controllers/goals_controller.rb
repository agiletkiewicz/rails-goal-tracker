class GoalsController < ApplicationController

    before_action :require_login

    def index
        @goals = Goal.where(user_id: session[:user_id])
        if params[:user_id]
            redirect_to '/' unless session[:user_id] == params[:user_id].to_i
        end
    end

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

    def show 
        @goal = Goal.find_by(id: params[:id])
        if @goal.user_id == current_user.id
            @task= Task.new
        else
            redirect_to '/'
        end
    end

    def edit 
        @goal = Goal.find_by(id: params[:id])
        @user = User.find_by(id: session[:user_id])

        redirect_to '/' unless @goal.user_id == current_user.id
    end

    def update
        @goal = Goal.find_by(id: params[:id])
        @goal.update(goal_params)
        @goal.save

        redirect_to goals_path
    end

    private 

    def goal_params 
        params.require(:goal).permit(:description, :key_result, :by_when, :nickname, :category_id, :user_id)
    end

    def require_login
        return head(:forbidden) unless logged_in?
    end

    def correct_user?
        @goal = Goal.find_by(id: params[:id])
        return head(:forbidden) unless @goal.user_id == current_user.id
    end

end
