class MenusController < ApplicationController
  def new
    @menu = Menu.new
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def create
    @menu = Menu.new(nombre: params[:menu][:nombre],
      descripcion: params[:menu][:descripcion],
      idlocal: Comuna.find_by("nombre = ?", params[:local][:nombre_comuna]).id,
      precio: params[:menu][:precio]) 
  end
end
