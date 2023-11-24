# frozen_string_literal: true

# This class is responsible for handling Pacjents
class PacjenciController < ApplicationController
  def index
    @pacjenci = Pacjent.all
  end

  def show
    @pacjent = Pacjent.find(params[:id])
  end
end
