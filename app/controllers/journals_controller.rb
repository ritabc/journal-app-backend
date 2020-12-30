class JournalsController < ApplicationController
  before_action :set_journal, only: [:show, :update, :destroy]

  # GET /journals
  def index
    @journals = Journal.where(user_id: @user.id)

    render json: @journals
  end

  # GET /journals/1
  def show
    if @journal.user_id == @user.id
      render json: @journal
    else
      render json: {error: "User not authorized"}
    end
  end

  # POST /journals
  def create
    @journal = Journal.new(journal_params)
    @journal.user_id = @user.id
    if @journal.save
      render json: @journal, status: :created, location: @journal
    else
      render json: @journal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /journals/1
  # def update
  #   if @journal.update(journal_params)
  #     render json: @journal
  #   else
  #     render json: @journal.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /journals/1
  def destroy
    if @journal.user_id == @user.id
      @journal.destroy
    else 
      render json: {error: "User not authorized"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal
      @journal = Journal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def journal_params
      params.require(:journal).permit(:name, :description)
    end
end
