class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    @appointment.pacjent_id = params[:pacjent_id] if params[:pacjent_id]
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to pacjents_path, notice: 'Rezerwacja została dokonana pomyślnie.'
    else
      render :new
    end
  end

  def pacjent
    @pacjent = Pacjent.find(params[:id])
    @appointments = @pacjent.appointments
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doktor_id, :pacjent_id, :date, :godzina, :cena)
  end
end
