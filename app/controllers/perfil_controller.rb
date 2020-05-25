class PerfilController < ApplicationController

  
  # Read
  def index
    @users = User.all
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
    user_params = params.require(:user).permit(:nombre, :email, :descripcion, :edad, :telefono)
    @user = User.find(params[:id])

    unless user_params[:nombre].empty?
      if @user.update(user_params)
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
    user_interest_id = params.require(:interest).permit(:id_interest)
    @interest = Interest.find('1')
    print Interest.find('1').nombre
    @user = User.find(params[:id])
    @user.interests << @interest
    redirect_to perfil_path(@user.id), notice: 'Revisar si se agregó el interes'
  end

  #Delete
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: 'Usuario eliminado con exito' 

  end

end
