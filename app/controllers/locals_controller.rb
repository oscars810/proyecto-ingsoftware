class LocalsController < ApplicationController
  def new
    @local = Local.new
  end

  def show
  end

  def index
  end

  def edit
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
end
