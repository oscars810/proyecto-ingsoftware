class MenusController < ApplicationController
  def new
    @menu = Menu.new
    @idlocal = params[:idlocal]
  end

  def create
    @menu = Menu.new(nombre: params[:menu][:nombre],
      descripcion: params[:menu][:descripcion],
      idlocal: params[:id],
      precio: params[:menu][:precio])
    
    if @menu.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @menu = Menu.find_by(id: params[:id])
    @idlocal = params[:idlocal]
  end

  def update
    @menu = Menu.find_by(id: params[:id])
    @idlocal = params[:menu][:idlocal]
    if @menu.update(nombre: params[:menu][:nombre], descripcion: params[:menu][:descripcion], precio: params[:menu][:precio])
      redirect_to local_edit_path(@idlocal)
    else
      redirect_to local_edit_path(@idlocal)
    end
  end

  def destroy
    @menu = Menu.find(params[:id_menu])
    @menu.destroy
    redirect_back(fallback_location: root_path, notice: 'Comentario eliminado con éxito')
  end
end
