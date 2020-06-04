class AppointmentController < ApplicationController
  def new
    @appointment = Appointment.new
  end

  def create
    appointment_params = params.require(:appointment).permit(:local_id, :fecha)
    appointment_params[:match_id] = params[:match_id]
    appointment_params[:solicitante_id] = params[:id]
    appointment = Appointment.new(appointment_params)
    if appointment.save
      redirect_to perfil_path(params[:id])
    else
      redirect_to new_appointment_path(params[:id], match_id: params[:match_id])
    end
  end
end
