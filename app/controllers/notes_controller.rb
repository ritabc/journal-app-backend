require "securerandom"

class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy, :edit]

  # GET journal/:journal_id/notes
  def index
    journal = Journal.find(params[:journal_id])
    if @user.id == journal.user_id
      @notes = Note.where(journal_id: journal.id)
      render json: @notes
    else 
      render json: {error: "User not authorized"}
    end
  end

  # GET journal/:journal_id/notes/1
  def show
    journal = Journal.find(params[:journal_id])
    if @user.id == journal.user_id
      render json: @note
    else
      render json: {error: "User not authorized"}
    end
  end

  # POST journals/journal_id/notes
  def create
    journal = Journal.find(params[:journal_id])
    if @user.id == journal.user_id
      @note = Note.new(note_params)
      @note.journal_id = journal.id
      @note.id = SecureRandom.uuid
      if @note.save
        render json: @note, status: :created
      else
        render json: @note.errors, status: :unprocessable_entity
      end
    else 
      render json: {error: "User not authorized"}
    end
  end

  # GET /journals/journal_id/notes/note_id/edit (data for note edit form)
  def edit
    journal = Journal.find(params[:journal_id])
    if @user.id == journal.user_id
      render json: @note
    else 
      render json: {error: "User not authorized"}
    end
  end

  # PATCH/PUT journals/journal_id/notes/note_id
  def update
    journal = Journal.find(params[:journal_id])
    if @user.id == journal.user_id
      if @note.update(note_params)
        render json: @note
      else
        render json: @note.errors, status: :unprocessable_entity
      end
    else
      render json: {error: "User not authorized"}
    end
  end

  # DELETE journals/journal_id/notes/note_id
  def destroy
    journal = Journal.find(params[:journal_id])
    note_id = @note.id.to_s
    if @user.id == journal.user_id && @note.journal_id == journal.id
      @note.destroy
      render json: {msg: `Note ##{note_id} successfully destroyed`}
    else
      render json: {error: "User not authorized"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def note_params
      params.require(:note).permit(:title, :content)
    end
end
