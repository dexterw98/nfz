class Pacjent < ApplicationRecord
  has_many :appointments

  def full_name
    "#{imie} #{nazwisko}"
  end
end
