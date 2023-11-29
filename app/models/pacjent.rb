# frozen_string_literal: true

# This class represents a patient.
class Pacjent < ApplicationRecord
  has_many :appointments

  def self.grouped_by_birth_year
    Pacjent.group("strftime('%Y', urodziny)")
           .order("strftime('%Y', urodziny)")
           .count
  end

  def full_name
    "#{imie} #{nazwisko}"
  end
end
