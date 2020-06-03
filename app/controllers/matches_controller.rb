class MatchesController < ApplicationController
  def show
  end

  def index
    unless user_signed_in?
      redirect_to root_path, notice: 'Usted debe iniciar secion para poder realizar match'
    else
      #@users = User.all.paginate(page: params[:page], per_page: 2)
      @user = User.find(params[:id])

      @users = User.where("id != " + @user.id.to_s).paginate(page: params[:page], per_page: 2)
      
    end
  end

end
