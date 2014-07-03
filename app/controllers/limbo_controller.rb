class LimboController < ApplicationController


  def home
      if signed_in?
      else
        redirect_to(new_user_registration_path)
      end
      @micrositios = Micrositio.all
      @eventos = Evento.all
      @actividades = Actividad.all
      @users = User.all
      @user = User.new
  end



  def instrucciones
    @actividades = Actividad.all
  end








end