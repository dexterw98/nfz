class AddPlecToPacjents < ActiveRecord::Migration[6.0]
  def change
    add_column :pacjents, :plec, :string
  end
end
