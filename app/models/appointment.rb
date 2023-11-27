class Appointment < ApplicationRecord
  belongs_to :doktor
  belongs_to :pacjent

  validate :termin_dostepny, :poprawna_cena

  private
    def termin_dostepny
      unless doktor.available_at?(DateTime.new(date.year, date.month, date.day, date.hour, date.min))
        errors.add(:base, "Termin jest już zajęty")
      end
    end

  def poprawna_cena
    errors.add(:cena, "Cena musi być większa niż 0") if cena <= 0
  end
end
