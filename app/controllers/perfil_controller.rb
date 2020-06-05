class PerfilController < ApplicationController

  
  # Read
  def index
    @users = User.where("admin = false")
    render :layout => 'admin'
  end

  #Show
  def show
    if user_signed_in? and current_user.id == params[:user_id].to_i
      @user = User.find(params[:user_id])
      @local = @user.local
      @commune = @user.commune
      @interests_user = @user.interests
      @interests_all = Interest.all
      @interests_not_user = []

      @interests_all.each do |interest|
        repetido = false
        @interests_user.each do |interest_user|
          if interest_user.nombre == interest.nombre
            repetido = true
            break
          end
        end

        if not repetido
          @interests_not_user << interest
        end
      end

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
    else
      redirect_to root_path, notice: 'No puedes acceder a esta página'
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
    redirect_to perfil_path(@user.id), notice: 'El interés ha sido eliminado de forma exitosa'
  end

  #Delete
  def destroy
    @user = User.find(params[:id])
    @match_request_solicitante = MatchRequest.where('solicitante_id = ' + @user.id.to_s)
    @match_request_solicitado = MatchRequest.where('solicitado_id = ' + @user.id.to_s)

    @match_request_solicitante.each do |match_request|
      match_request.destroy
    end

    @match_request_solicitado.each do |macth_request|
      macth_request.destroy
    end

    @match_1 = Match.where('user1_id = ' + @user.id.to_s)
    @match_2 = Match.where('user2_id = ' + @user.id.to_s)
    
    @match_1.each do |match|
      macth.destroy
    end

    @match_2.each do |match|
      match.destroy
    end

    @user.destroy
    redirect_to root_path, notice: 'Usuario eliminado con exito' 

  end
end
