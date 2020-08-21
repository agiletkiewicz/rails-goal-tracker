class TasksController < ApplicationController

    before_action :require_login
    before_action :correct_user?
    skip_before_action :correct_user?, only: [:index, :new, :create, :completed]

    def create 
        @goal = Goal.find_by(id: params[:goal_id])
        @task = @goal.tasks.build(task_params)
        if @task.save 
            redirect_to goal_path(@goal)
        else 
            @open_tasks = @goal.ordered_open_tasks
            @closed_tasks = @goal.ordered_closed_tasks
            @notes = @goal.notes
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
            @tasks = @goal.ordered_open_tasks
            return head(:forbidden) unless @goal.user_id == current_user.id
        else 
            @tasks = current_user.ordered_open_tasks
        end
    end

    def destroy
        @task = Task.find_by(id: params[:id])
        @task.destroy

        redirect_to goal_path(@task.goal)
    end

    def completed
        @tasks = current_user.tasks.completed    
    end

    private

    def task_params 
        params.require(:task).permit(:description, :by_when, :goal_id, :complete, :completed_date)
    end

    def correct_user?
        @task = Task.find_by(id: params[:id])
        return head(:forbidden) unless current_user.tasks.include?(@task)
    end

end
