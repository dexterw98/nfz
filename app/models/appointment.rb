class Appointment < ApplicationRecord
  belongs_to :doktor
  belongs_to :pacjent
end
