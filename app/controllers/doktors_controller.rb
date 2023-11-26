# frozen_string_literal: true

# This class is responsible for handling requests related to doktors.
class DoktorsController < ApplicationController
  def index
    @doktors = Doktor.all
  end
end
