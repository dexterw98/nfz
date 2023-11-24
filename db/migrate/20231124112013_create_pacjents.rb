class CreatePacjents < ActiveRecord::Migration[6.0]
  def change
    create_table :pacjents do |t|
      t.string :imie
      t.string :nazwisko
      t.date :urodziny
      t.string :miasto
      t.string :pesel

      t.timestamps
    end
  end
end
