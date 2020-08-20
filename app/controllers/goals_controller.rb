class GoalsController < ApplicationController

    before_action :require_login

    def index
        @goals = current_user.goals
        @user = current_user
        @goal = Goal.new
    end

    def new 
        @user = current_user
        @goal = Goal.new
    end

    def create
        @user = current_user
        @goal = Goal.new(goal_params)
        @goal.user = @user 
        if @goal.save
            redirect_to goal_path(@goal)
        else 
            @goals = current_user.goals
            render :index 
        end
    end

    def show 
        @goal = Goal.find_by(id: params[:id])
        if @goal.user_id == current_user.id
            @task= Task.new
            @note = Note.new
        else
            redirect_to '/'
        end
    end

    def edit 
        @goal = Goal.find_by(id: params[:id])
        @user = current_user

        redirect_to '/' unless @goal.user_id == current_user.id
    end

    def update
        @goal = Goal.find_by(id: params[:id])
        @goal.update(goal_params)
        @goal.save

        redirect_to goals_path

    end

    def destroy
        @goal = Goal.find_by(id: params[:id])
        @goal.destroy

        redirect_to goals_path
    end

    private 

    def goal_params 
        params.require(:goal).permit(:description, :key_result, :by_when, :nickname, :category_id, :user_id, :complete, :completed_date)
    end

    def require_login
        return head(:forbidden) unless logged_in?
    end

    def correct_user?
        @goal = Goal.find_by(id: params[:id])
        return head(:forbidden) unless @goal.user_id == current_user.id
    end

end
