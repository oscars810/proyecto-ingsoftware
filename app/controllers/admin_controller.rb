class AdminController < ApplicationController
  layout "admin"

  def aceptar_locales
      @locales_pendientes = Local.where("aceptado = ?", false)
  end

  def aceptar_local
  end

  def ver_locales
    @locales = Local.where("aceptado = ?", true)
    render 'locales'
  end
end
