class StructuredNotesController < ApplicationController
  before_action :set_structured_note, only: [:show, :update, :destroy]

  # GET /structured_notes
  # GET /structured_notes.json
  def index
    @structured_notes = StructuredNote.all

    render json: @structured_notes
  end

  # GET /structured_notes/1
  # GET /structured_notes/1.json
  def show
    render json: @structured_note
  end

  # POST /structured_notes
  # POST /structured_notes.json
  def create
    @structured_note = StructuredNote.new(structured_note_params)

    if @structured_note.save
      render json: @structured_note, status: :created, location: @structured_note
    else
      render json: @structured_note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /structured_notes/1
  # PATCH/PUT /structured_notes/1.json
  def update
    @structured_note = StructuredNote.find(params[:id])

    if @structured_note.update(structured_note_params)
      head :no_content
    else
      render json: @structured_note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /structured_notes/1
  # DELETE /structured_notes/1.json
  def destroy
    @structured_note.destroy

    head :no_content
  end

  private

    def set_structured_note
      @structured_note = StructuredNote.find(params[:id])
    end

    def structured_note_params
      params.require(:structured_note).permit(:name, :dx, :tx, :cause_desc, :prognosis)
    end
end
