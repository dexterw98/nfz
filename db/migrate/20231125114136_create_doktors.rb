class CreateDoktors < ActiveRecord::Migration[6.0]
  def change
    create_table :doktors do |t|
      t.string :imie
      t.string :nazwisko

      t.timestamps
    end
  end
end
