class MiperfilController < ApplicationController

  # Read
  def index
    @users = User.all
  end

  #Show
  def show
    @user = User.find(params[:id])
  end

  #Update
  def edit
    @user = User.find(params[:id])
  end

  def update
    user_params = params.require(:user).permit(:nombre, :email, :descripcion, :edad, :telefono)
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to mi_perfil_path(@user.id), notice: 'Datos de usuario actualizados con éxito'
    else
      redirect_to mi_perfil_path(@user.id), notice: 'Ocurrio un error al actualizar los datos'
    end
  end

  #Delete
  def destroy

    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: 'Usuario eliminado con exito' 

  end

end