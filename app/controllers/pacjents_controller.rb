# frozen_string_literal: true

require 'csv'

# This class is responsible for handling Pacjents
class PacjentsController < ApplicationController
  def index
    @pacjenci = Pacjent.all
  end

  def show
    @pacjent = Pacjent.find(params[:id])
  end

  def new
    @pacjent = Pacjent.new
  end

  def create
    @pacjent = Pacjent.new(patient_params)
    if @pacjent.save
      redirect_to pacjents_path, notice: 'Pacjent dodany pomyślnie.'
    else
      render :new
    end
  end

  def patient_params
    params.require(:pacjent).permit(:imie, :nazwisko, :data_urodzenia, :miasto, :plec, :pesel)
  end
end