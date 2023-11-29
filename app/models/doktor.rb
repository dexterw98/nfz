# frozen_string_literal: true

# This class represents a Doktor and provides methods for managing appointments and checking availability.
class Doktor < ApplicationRecord
  has_many :appointments

  def available_at?(datetime)
    datetime.during_business_hours? &&
      (datetime + 20.minutes).during_business_hours? &&
      appointments.where('date BETWEEN ? AND ?', datetime - 19.minutes, datetime).none?
  end

  def full_name
    "#{imie} #{nazwisko}"
  end
end
