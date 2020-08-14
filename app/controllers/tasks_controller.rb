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

        if params[:task][:target] == "goal"    
            redirect_to goal_path(@task.goal)
        elsif params[:task][:target] == "home" 
            redirect_to '/'
        end
    end

    def index
        @tasks = current_user.tasks
    end

    def destroy
        @task = Task.find_by(id: params[:id])
        @task.destroy

        redirect_to goal_path(@task.goal)
    end

    private

    def task_params 
        params.require(:task).permit(:description, :by_when, :goal_id, :complete)
    end

end
