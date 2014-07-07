class ReserervationsController < ApplicationController
  before_action :set_reserervation, only: [:show, :edit, :update, :destroy]

  # GET /reserervations
  # GET /reserervations.json
  def index
    @reserervations = Reserervation.all
  end

  # GET /reserervations/1
  # GET /reserervations/1.json
  def show
  end

  # GET /reserervations/new
  def new
    @reserervation = Reserervation.new
  end

  # GET /reserervations/1/edit
  def edit
  end

  # POST /reserervations
  # POST /reserervations.json
  def create
    @reserervation = Reserervation.new(reserervation_params)

    respond_to do |format|
      if @reserervation.save
        format.html { redirect_to @reserervation, notice: 'Reserervation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @reserervation }
      else
        format.html { render action: 'new' }
        format.json { render json: @reserervation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reserervations/1
  # PATCH/PUT /reserervations/1.json
  def update
    respond_to do |format|
      if @reserervation.update(reserervation_params)
        format.html { redirect_to @reserervation, notice: 'Reserervation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reserervation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reserervations/1
  # DELETE /reserervations/1.json
  def destroy
    @reserervation.destroy
    respond_to do |format|
      format.html { redirect_to reserervations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserervation
      @reserervation = Reserervation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reserervation_params
      params[:reserervation]
    end
end
