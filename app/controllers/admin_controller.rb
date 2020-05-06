class AdminController < ApplicationController
  layout "admin"

  def aceptar_locales
      @locales_pendientes = Local.where("aceptado = ?", false)
  end
end
