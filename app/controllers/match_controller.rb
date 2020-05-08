class MatchController < ApplicationController
  def show
  end

  def index
    unless user_signed_in?
      redirect_to root_path, notice: 'Usted debe iniciar secion para poder realizar match'
    else
      @users = User.all
      @user = User.find(params[:id])
    end
  end

end
