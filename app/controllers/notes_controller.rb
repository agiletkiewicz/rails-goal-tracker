class NotesController < ApplicationController

    def create
        @goal = Goal.find_by(id: params[:goal_id])
        @note = Note.new(note_params)
        @note.goal = @goal 
        if @note.save 
            redirect_to goal_path(@goal)
        else 
            @task = Task.new
            render 'goals/show'
        end
    end

    def new 
        @note = Note.new
        @goal = Goal.find_by(id: params[:goal_id])
    end

    def destroy
        @note = Note.find_by(id: params[:id])
        @note.destroy

        redirect_to goal_path(@note.goal)
    end

    private

    def note_params 
        params.require(:note).permit(:content, :goal_id)
    end

end
