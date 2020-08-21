class NotesController < ApplicationController

    before_action :require_login
    before_action :correct_user?
    skip_before_action :correct_user?, only: [:new, :create]

    def create
        @goal = Goal.find_by(id: params[:goal_id])
        @note = @goal.notes.build(note_params)
        if @note.save 
            redirect_to goal_path(@goal)
        else 
            render 'new'
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

    def correct_user?
        @note = Note.find_by(id: params[:id])
        return head(:forbidden) unless current_user.notes.include?(@note)
    end

end
