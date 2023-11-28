class Pacjent < ApplicationRecord
  has_many :appointments

  scope :grouped_by_birth_decade, -> { select("strftime('%Y', urodziny) - (strftime('%Y', urodziny) % 10) AS birth_decade, COUNT(*)").group("birth_decade").order("birth_decade") }

  def full_name
    "#{imie} #{nazwisko}"
  end
end
