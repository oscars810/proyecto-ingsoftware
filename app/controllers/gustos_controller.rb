class GustosController < ApplicationController
  layout "admin"

  # Create
  def new
    @gusto = Gusto.new
  end

  def create
    gusto_params = params.require(:gusto).permit(:nombre, :descripcion)
    @gusto = Gusto.create(gusto_params)

    if @gusto.save
      redirect_to gustos_path, notice: 'Gusto creado con éxito'
    else
      redirect_to gustos_new_path, notice: 'Ocurrió un error al crear el gusto'
    end
  end

  # Read

  def index
    @gustos = Gusto.all
  end

  def show
    @gusto = Gusto.find(params[:id])
  end

  # Update

  def edit
    @gusto = Gusto.find(params[:id])
  end

  def update
    gusto_params = params.require(:gusto).permit(:nombre, :descripcion)
    @gusto = Gusto.find(params[:id])

    if @gusto.update(gusto_params)
      redirect_to gusto_path(@gusto.id), notice: 'Gusto editado con éxito'
    else
      redirect_to gustos_new_path, notice: 'Ocurrió un error al editar el gusto'
    end
  end

  # Delete

  def destroy
    @gusto = Gusto.find(params[:id])
    @gusto.destroy
    redirect_to gustos_path, notice: 'Gusto eliminado con éxito'
  end

end
