# frozen_string_literal: true

require 'csv'

# This class is responsible for handling Pacjents
class PacjentsController < ApplicationController
  include Pagy::Backend
  include Pagy::Frontend 
  def index
    @q = Pacjent.ransack(params[:q])
    @pagy, @pacjents = pagy(@q.result(distinct: true))
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

  def urodzenia_statystyki
    @urodzenia_statystyki = Pacjent.grouped_by_birth_decade

    respond_to do |format|
      format.html
      format.json { render json: { data: @urodzenia_statystyki.map { |record| { label: "#{record.birth_decade}-#{record.birth_decade + 9}", value: record.count } } } }
    end
  end

  def patient_params
    params.require(:pacjent).permit(:imie, :nazwisko, :data_urodzenia, :miasto, :plec, :pesel)
  end
end
