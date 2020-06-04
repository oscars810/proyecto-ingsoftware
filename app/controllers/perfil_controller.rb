class PerfilController < ApplicationController

  
  # Read
  def index
    @users = User.where("admin = false")
  end

  #Show
  def show
    unless user_signed_in?
      redirect_to root_path, notice: 'Usted debe ingresar sesión para poder ver el perfil de otro usuario'
    else
      @user = User.find(params[:id])
      @commune = @user.commune
      @interests_user = @user.interests
      @interests_all = Interest.all
      @pending_valuations = current_user.valuations.where("realizada = false")

      #Cada vez que entra a su perfil busca posibles match que se hayan hecho mutuamente por casualidad
      @match_nuevos = MatchRequest.where('solicitado_id = ?', @user.id)
      @match_nuevos.each do |m|
        @match_coincidentes = MatchRequest.where('solicitado_id = ? and solicitante_id = ?', m.solicitante_id, @user.id)
        if @match_coincidentes
          @match_coincidentes.each do |m2|
            match = Match.new(user1_id: m2.solicitante_id,
              user2_id: m2.solicitado_id,
              cita_realizada: false,
              appointment_id: nil)
            match.save!
            m2.destroy
            m.destroy
          end
        end
      end
      @match_nuevos = MatchRequest.where('solicitado_id = ?', @user.id)
      @match_todos = Match.where('user1_id = ? or user2_id = ?', @user.id, @user.id)
    end
  end

  #Update
  def edit
    unless user_signed_in?
      redirect_to root_path, notice: 'Usted debe ingresar sesión para poder ver el perfil de otro usuario'
    else
      @user = User.find(params[:id])
    end
  end

  def update
    user_params = params.require(:user).permit(:nombre, :email, :descripcion, :edad, :telefono, :commune_id)
    print("ESTOY EN EL CONTROLADOR")

    @user = User.find(params[:id])

    unless user_params[:nombre].empty?
      if @user.update(user_params)
        #@user.commune_id = @commune
        redirect_to perfil_path(@user.id), notice: 'Datos de usuario actualizados con éxito'

      else
        redirect_to perfil_path(@user.id), notice: 'Ocurrio un error al actualizar los datos'
      end
    else
      redirect_to perfil_path(@user.id), notice: 'Tu nombre no puede ser vacío'
    end
  end

  #Update interests
  def update_interest
    @interest = Interest.find(params[:id_interest])
    @user = User.find(params[:id])
    @user.interests << @interest
    redirect_to perfil_path(@user.id), notice: 'Gusto agregado de forma exitosa'
  end

  def delete_interest
    @interest = Interest.find(params[:idinterest])
    @user = User.find(params[:id])
    @user.interests.delete(@interest)
    redirect_to perfil_path(@user.id), notice: 'Revisar si se eliminó el interes'
  end

  #Delete
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: 'Usuario eliminado con exito' 

  end
end
