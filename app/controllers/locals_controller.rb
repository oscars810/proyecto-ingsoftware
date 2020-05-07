class LocalsController < ApplicationController
  def new
    if not current_user
      redirect_to locales_path
    else
      if Local.find_by('idusuario = ?', current_user.id)
        redirect_to locales_path
      else
        @local = Local.new

      end
    end
  end

  def show
  end

  def index
    @locales = Local.all
  end

  def edit
    unless current_user and current_user.id ==  Local.find_by('id = ?', params[:id]).idusuario
      redirect_to local_path
    else
      @local = Local.find(params[:id])
    end
  end

  def create
    @local = Local.new(nombre: params[:local][:nombre],
                      descripcion: params[:local][:descripcion],
                      idcomuna: Comuna.find_by("nombre = ?", params[:local][:nombre_comuna]).id,
                      idusuario: current_user.id) 

    if @local.save
      redirect_to locales_new_path, notice: 'Local agregado de pana' 
    else
      redirect_to locales_new_path, notice: 'Falla en la agregacion del local' 
    end
  end

  def update
    @local = Local.find_by(id: params[:id])

    if @local.update(descripcion: params[:local][:descripcion])
      redirect_to local_path(@local.id)
    else @local.update(descripcion: params[:local][:descripcion])
      redirect_to local_path(@local.id)
    end
  end
end