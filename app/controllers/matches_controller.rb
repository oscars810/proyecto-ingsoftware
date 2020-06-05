class MatchesController < ApplicationController
  def show
  end

  def index
    unless user_signed_in?
      redirect_to root_path, notice: 'Usted debe iniciar secion para poder realizar match'
    else
      #@users = User.all.paginate(page: params[:page], per_page: 2)
      @user = User.find(params[:id])

    @users_previus = User.where("id != " + @user.id.to_s + " AND admin = false")
    @matches_request = MatchRequest.where("solicitante_id = " + @user.id.to_s)
    @users = []
    
    @users_previus.each do |user|
      repetido = false
      @matches_request.each do |match_request|
        if match_request.solicitado_id == user.id
          repetido = true
          break
        end
      end
      if not repetido
        @users << user
      end
    end
    @users = @users.shuffle!
    @users = @users.paginate(page: params[:page], per_page: 3)
      
    end
  end

  def new
    @user = User.find(params[:id])
    @user_solicitud = User.find(params[:idsolicitado])
    @match_request = MatchRequest.new(
      solicitante_id: @user.id,
      solicitado_id: @user_solicitud.id
    )
    @match_request.save!
    

    redirect_to match_path(@user.id)
  end
end
