class NotesController < ApplicationController

    def create
        @goal = Goal.find_by(id: params[:goal_id])
        @note = Note.new(note_params)
        @note.goal = @goal 
        @note.save 

        redirect_to goal_path(@goal)
    end

    private

    def note_params 
        params.require(:note).permit(:content, :goal_id)
    end

end
