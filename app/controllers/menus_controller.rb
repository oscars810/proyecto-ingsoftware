class MenusController < ApplicationController
  def new
    @menu = Menu.new
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
  end

  def update
    @menu = Menu.find_by(id: params[:menu][:id])
    menu_params = params.require(:menu)
    if @menu.update(menu_params)
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
  end
end
