class EventosController < ApplicationController
  before_action :set_evento, only: [:show, :edit, :update, :destroy]

  # GET /eventos
  # GET /eventos.json
  def index
    @eventos = Evento.all
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
    @eventos = Evento.all
    @micrositioevento= Micrositio.all

  end

  # GET /eventos/new
  def new
    @evento = Evento.new
    @estados = Estado.new
  end

  # GET /eventos/1/edit
  def edit
  end

  # POST /eventos
  # POST /eventos.json
  def create
    @evento = Evento.new(evento_params)
    respond_to do |format|
      if @evento.save
        format.html { redirect_to @evento, notice: 'Evento was successfully created.' }
        format.json { render action: 'show', status: :created, location: @evento }
      else
        format.html { render action: 'new' }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos/1
  # PATCH/PUT /eventos/1.json
  def update
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to @evento, notice: 'Evento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    @evento.destroy
    respond_to do |format|
      format.html { redirect_to eventos_url }
      format.json { head :no_content }
    end
  end


  def has_attached_file
  end

  def photo
  end

  def search
    @eventos = Evento.search params[:search]
  end


  private
    # Use callbacks to share common setup or constraints between actions.
  def set_evento
    @evento = Evento.friendly.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      params[:evento].permit(:nombre, :descripcion, :photo, :precio, :fecha, :artista, :urloficial, :estado)
    end

  def correct_user
    @evento = current_user.eventos.find_by(id: params[:id])
    redirect_to root_url if @evento.nil?
  end


end
