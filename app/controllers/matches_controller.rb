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

  def accept_match
    if params[:aceptar]
      @user = User.find(params[:id])
      @match_request = MatchRequest.find(params[:id_matchrequest])
      match = Match.new(user1_id: @match_request.solicitante_id,
                user2_id: @match_request.solicitado_id,
                cita_realizada: false,
                appointment_id: nil)
      match.save!
      @match_request.destroy
      redirect_to perfil_path(@user.id)
    else
      @user = User.find(params[:id])
      @match_request = MatchRequest.find(params[:id_matchrequest])
      @match_request.destroy
      redirect_to perfil_path(@user.id)
    end
  end

  def propuse_appointment
    @user = User.find(params[:id])
    @match = Match.find(params[:match_id])
    @match.update(:cita_realizada => true)
  end
end
