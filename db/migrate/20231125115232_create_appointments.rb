class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :doktor, null: false, foreign_key: true
      t.datetime :date
      t.references :pacjent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
