class TasksController < ApplicationController

    def create 
        @goal = Goal.find_by(id: params[:goal_id])
        @task = Task.new(task_params)
        @task.goal = @goal 
        @task.save 

        redirect_to goal_path(@goal)
    end

    def edit 
        @task = Task.find_by(id: params[:id])
    end

    def update
        @task = Task.find_by(id: params[:id])
        @task.update(task_params)
        @task.save

        redirect_to goal_path(@task.goal)
    end

    def index
        @tasks = current_user.tasks
    end

    private

    def task_params 
        params.require(:task).permit(:description, :by_when, :goal_id, :complete)
    end

end
