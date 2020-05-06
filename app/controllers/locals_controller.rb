class LocalsController < ApplicationController
  def new
    @local = Local.new
  end

  def show
  end

  def index
    @locales = Local.all
  end

  def edit
    @local = Local.find(params[:id])
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
