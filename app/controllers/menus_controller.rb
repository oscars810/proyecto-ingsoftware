class MenusController < ApplicationController
  def new
    unless user_signed_in? and current_user.id == Local.find(params[:local_id]).user_id
      redirect_to local_index_path, notice: 'No puedes acceder a esta página'
    else
      @menu = Menu.new
      @local_id = params[:local_id]
    end
  end

  def create
    menu_params = params.require(:menu).permit(:nombre, :descripcion, :precio)
    @local_id = params[:local_id]
    menu_params[:local_id] = @local_id
    @menu = Menu.new(menu_params)
    
    if @menu.save
      redirect_to edit_local_path(@local_id), notice: 'El menú ha sido agregado con éxito'

    else
      redirect_to edit_local_path(@local_id), notice: 'Ocurrió un error al agregar un menú'
    end
  end

  def edit
    unless user_signed_in? and current_user.id == Local.find(params[:local_id]).user_id
      redirect_to local_index_path, notice: 'No puedes acceder a esta página'
    else
      @menu = Menu.find(params[:id])
      @local_id = params[:local_id]
    end
  end

  def update
    @menu = Menu.find(params[:id])
    @local_id = params[:local_id]
    menu_params = params.require(:menu).permit(:nombre, :descripcion, :precio)
    if @menu.update(menu_params)
      redirect_to edit_local_path(@local_id), notice: 'El menú ha sido editado con éxito'
    else
      redirect_to edit_local_path(@local_id), notice: 'Ocurrió un error al editar el menú'
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @local_id = params[:local_id]
    @menu.destroy
    redirect_to edit_local_path(@local_id), notice: 'El menú ha sido eliminado con éxito'
  end
end
