class AddCenaToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :cena, :float
  end
end
