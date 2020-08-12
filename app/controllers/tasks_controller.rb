class TasksController < ApplicationController

    def create 
        @goal = Goal.find_by(id: params[:goal_id])
        @task = Task.new(task_params)
        @task.goal = @goal 
        @task.save 

        redirect_to goal_path(@goal)
    end

    private

    def task_params 
        params.require(:task).permit(:description, :by_when, :goal_id)
    end

end
