class NotelimitesController < ApplicationController


  def home
      @micrositios = Micrositio.all
      @eventos = Evento.all
      @actividades = Actividad.all
      @users = User.all
  end



  def instrucciones
    @actividades = Actividad.all
  end

  def places
    @micrositio = Micrositio.all

    respond_to do |format|
      if @micrositio.update(micrositio_params)
        format.html { redirect_to @micrositio, notice: 'Micrositio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @micrositio.errors, status: :unprocessable_entity }
      end
    end

  end






end