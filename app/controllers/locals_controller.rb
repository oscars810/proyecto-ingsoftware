class LocalsController < ApplicationController
  def new
    unless user_signed_in?
      redirect_to local_index_path, notice: 'Debes tener una cuenta para crear un local.'
    else
      if Local.find_by('user_id = ?', current_user.id)
        redirect_to local_index_path, notice: 'Tu cuenta ya tiene un local asociado.'
      else
        @lista_comunas = []
        Commune.all.each do |comuna|
          @lista_comunas.append(comuna.nombre)
        end
        @local = Local.new
      end
    end
  end

  def create
    local_params = params.require(:local).permit(:nombre, :descripcion, :nombre_comuna)
    parametros = Hash.new
    parametros[:nombre], parametros[:descripcion] = local_params[:nombre], local_params[:descripcion]
    parametros[:user_id] = current_user.id
    id_comuna = Commune.find_by("nombre = ?", local_params[:nombre_comuna]).id
    parametros[:commune_id] = id_comuna

    @local = Local.new(parametros)
    if @local.save
      redirect_to local_index_path, notice: 'Se ha enviado el formulario del local al administrador. Debes esperar que él acepte el local' 
    else
      redirect_to local_index_path, notice: 'Ha ocurrido un error al crear el local' 
    end
  end

  def show
    @local = Local.find(params[:id])
    unless @local.aceptado
      redirect_to local_index_path, notice: 'Este local aún no ha sido aceptado'
    else 
      @menus = @local.menus
      @comentarios = @local.comments
    end
  end

  def index
    @locales = Local.all
  end

  def edit
    @local = Local.find(params[:id])
    @menus = @local.menus
    unless user_signed_in? and current_user.id == Local.find(params[:id]).user_id
      redirect_to local_path, notice: 'No puedes acceder a esta página'
    else
      unless @local.aceptado
        redirect_to local_index_path, notice: 'No puedes editar tu local si no ha sido aceptado'
      else
        @local = Local.find(params[:id])
      end
    end
  end

  def update
    local_params = params.require(:local).permit(:descripcion)
    @local = Local.find(params[:id])

    if @local.update(local_params)
      redirect_to local_path(@local.id), notice: 'Local editado con éxito'
    else
      redirect_to local_path(@local.id), notice: 'Ocurrió un error al editar el local'
    end
  end

  def destroy
    @local = Local.find(params[:id])
    @local.destroy
    redirect_to local_index_path, notice: 'Local eliminado con éxito'
  end
end