class UsersController < ApplicationController
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
    @user = User.order(params[:sort])

  end

  def show
    @user = User.friendly.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    @eventos = @user.eventos.paginate(page: params[:page])
    @micrositios = @user.micrositios.paginate(page: params[:page])
    @micrositio = Micrositio.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to :back
    else
      render 'new'
    end
  end

  def edit
    @micrositio = Micrositio.friendly.find(params[:id])
    @estado = Estado.friendly.find(params[:id])
    @user = User.friendly.find(params[:id])
  end


  def update
    respond_to do |format|
      if current_user.update(current_user_params)
        format.html { redirect_to current_user}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def editcategorias
    @micrositios = Micrositio.all
    @estadosalf = Estado.order("estado")
    @actividad = Actividad.all
    @actividadpadres = Actividadpadre.all
    @categorias = Categoria.all
  end

  def editestados
    @micrositios = Micrositio.all
    @estadosalf = Estado.order("estado")
    @actividad = Actividad.all
    @actividadpadres = Actividadpadre.all
  end

  def editactividades
    @categorias = Categoria.all
    @micrositios = Micrositio.all
    @estadosalf = Estado.order("estado")
    @actividad = Actividad.all
    @actividadpadres = Actividadpadre.all
  end
  def editlugares
    @micrositios = Micrositio.all
    @estadosalf = Estado.order("estado")
    @actividad = Actividad.all
    @actividadpadres = Actividadpadre.all
  end
  def editusuarios
    @micrositios = Micrositio.all
    @usuarios = User.all
    @estadosalf = Estado.order("estado")
    @actividad = Actividad.all
    @actividadpadres = Actividadpadre.all
  end


  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to :back
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end


  def following
    @title = "Following"
    @user = User.friendly.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.friendly.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end







    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :photo, :lat, :lng, :admin)
    end

    # Before filters

    def correct_user
      @user = User.friendly.find(params[:id])
      redirect_to(root_url) unless signed_in?
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  end
