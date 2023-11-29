# frozen_string_literal: true

# Represents an appointment between a doctor and a patient.
class Appointment < ApplicationRecord
  belongs_to :doktor
  belongs_to :pacjent

  validate :termin_dostepny, :poprawna_cena, on: :create
  validate :poprawna_cena, on: :update

  private

  def termin_dostepny
    return if doktor.available_at?(DateTime.new(date.year, date.month, date.day, date.hour, date.min))

    errors.add(:base, 'Termin jest już zajęty')
  end

  def poprawna_cena
    errors.add(:cena, 'Cena musi być większa niż 0') if cena <= 0
  end
end
