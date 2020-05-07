class AdminController < ApplicationController
  layout "admin"

  def aceptar_locales
      @locales_pendientes = Local.where("aceptado = ?", false)
  end

  def aceptar_local
    @local = Local.find(params[:id])
    @local.update(:aceptado => true)
    redirect_to action:'aceptar_locales'
  end

  def ver_locales
    @locales = Local.where("aceptado = ?", true)
    render 'locales'
  end
end
