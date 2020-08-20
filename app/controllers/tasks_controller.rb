class TasksController < ApplicationController

    def create 
        @goal = Goal.find_by(id: params[:goal_id])
        @task = Task.new(task_params)
        @task.goal = @goal 
        if @task.save 

            redirect_to goal_path(@goal)
        else 
            @note = Note.new
            render 'goals/show'
        end
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
        else
            redirect_to goal_path(@task.goal)
        end

    end

    def index
        if params[:goal_id]
            @goal = Goal.find(params[:goal_id])
            @tasks = @goal.tasks
        else 
            @tasks = current_user.ordered_open_tasks
        end
    end

    def destroy
        @task = Task.find_by(id: params[:id])
        @task.destroy

        redirect_to goal_path(@task.goal)
    end

    private

    def task_params 
        params.require(:task).permit(:description, :by_when, :goal_id, :complete, :completed_date)
    end

end
