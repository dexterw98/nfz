# frozen_string_literal: true

# This is the AppointmentsController class.
# It handles the creation of new appointments and redirects to the pacjents_path.
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

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    @pacjent = @appointment.pacjent
    if @appointment.update(appointment_params)
      redirect_to pacjent_appointment_path(@pacjent), notice: 'Wizyta została zaktualizowana.'
    else
      Rails.logger.debug @appointment.errors.full_messages
      render :edit
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @pacjent = @appointment.pacjent
    @appointment.destroy
    redirect_to pacjent_appointment_path(@pacjent), notice: 'Wizyta została usunięta.'
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doktor_id, :pacjent_id, :date, :cena)
  end
end
