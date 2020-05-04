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
    l_params = params.require(:local).permit(:nombre, :comuna, :descripcion)
    @local = Local.create(l_params)

    if @local.save
      redirect_to new_path, notice: 'Local agregado de pana'
    else
      redirect_to new_path, notice: 'Falla en la agregacion del local'
    end
    
  end
end
