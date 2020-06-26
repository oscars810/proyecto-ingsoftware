class LocalsController < ApplicationController
  def new
    unless user_signed_in?
      redirect_to local_index_path, notice: 'Debes tener una cuenta para crear un local.'
    else
      if Local.find_by('user_id = ?', current_user.id)
        redirect_to local_index_path, notice: 'Tu cuenta ya tiene un local asociado.'
      else
        @local = Local.new
      end
    end
  end

  def create
    local_params = params.require(:local).permit(:nombre, :descripcion, :commune_id, :telefono, :direccion)
    local_params[:user_id] = current_user.id

    local_direccion = local_params[:direccion]

    require 'opencage/geocoder'
    geocoder = OpenCage::Geocoder.new(api_key: '60c54918b16a4e338ecb409cc525b948')
    results = geocoder.geocode(local_direccion)

    if results.first
      @coordenadas = results.first.coordinates
      local_params[:lat] = @coordenadas[0]
      local_params[:long] = @coordenadas[1]
      @local = Local.new(local_params)
      if @local.save
        redirect_to local_index_path, notice: 'Se ha enviado el formulario del local al administrador. Debes esperar que él acepte el local' 
      else
        redirect_to local_index_path, notice: 'Ha ocurrido un error al crear el local' 
      end
    else 
      redirect_to new_local_path, notice: 'La dirección ingresada no se ha podido encontrar. Se recomienda utilizar direcciones existentes en Google Maps'
    end
  end

  def show
    @local = Local.find(params[:id])
    @cantidad_valoraciones = @local.valuations.where("realizada = true").count
    @promedio = @local.valuations.where("realizada = true").average(:puntuacion)

    unless @promedio
      @promedio = "(El local aún no tiene puntuaciones)"
    else
      @promedio = @promedio.round(1)
      @promedio = " #{@promedio} / 5"
    end


    unless @local.aceptado
      redirect_to local_index_path, notice: 'Este local aún no ha sido aceptado'
    else 
      @menus = @local.menus
      @comentarios = @local.comments
    end
  end

  def index
    if params[:valoracion]
      if params[:valoracion] != 'Todas'
        max = params[:valoracion][-1]
        min = params[:valoracion][0]
        @locales = []
        if params[:commune_id] != 'Todas'
          all_locals = Local.where("commune_id = ?", params[:commune_id])
        else
          all_locals = Local.all
        end
        all_locals.each do |local|
          @promedio = local.valuations.where("realizada = true").average(:puntuacion)
          if @promedio 
            @promedio = @promedio.round(1)
            if @promedio >= min.to_i and @promedio <= max.to_i
              @locales = @locales.append(local)
            end
          end
        end
      elsif params[:commune_id] != 'Todas'
        @locales = Local.where("commune_id = ?", params[:commune_id])
      else
        @locales = Local.where("aceptado = true")
      end

    elsif params[:search]
      if params[:search] == ""
        @locales = Local.where("aceptado = true")
      else
        @locales = Local.where("nombre ILIKE ?", "%" + params[:search] + "%")
      end

    else
      @locales = Local.where("aceptado = true")
    end
  end

  def edit
    @local = Local.find(params[:id])
    @menus = @local.menus
    unless user_signed_in? and current_user.id == Local.find(params[:id]).user_id
      redirect_to local_path(@local.id), notice: 'No puedes acceder a esta página'
    else
      unless @local.aceptado
        redirect_to local_index_path, notice: 'No puedes editar tu local si no ha sido aceptado'
      else
        render
      end
    end
  end

  def images
    @local = Local.find(params[:local_id])
    unless user_signed_in? and current_user.id == @local.user_id
        redirect_to local_path(@local.id), notice: 'No puedes acceder a esta página'
    else
      unless @local.aceptado
          redirect_to local_index_path, notice: "No puedes editar tu local si no ha sido aceptado"
      else
        render
      end
    end
  end

  def update
    local_params = params.require(:local).permit(:descripcion, :telefono)
    @local = Local.find(params[:id])

    if @local.update(local_params)
      redirect_to local_path(@local.id), notice: 'Local editado con éxito'
    else
      redirect_to local_path(@local.id), notice: 'Ocurrió un error al editar el local'
    end
  end

  def destroy
    @local = Local.find(params[:id])
    @local.destroy
    redirect_to local_index_path, notice: 'Local eliminado con éxito'
  end
end