class CreateParkings < ActiveRecord::Migration[6.1]
  def change
    create_table :parkings do |t|
      t.string :placa
      t.string :cedula
      t.date :fecha
      t.string :nombre
      t.string :zona_parqueo
      t.string :token

      t.timestamps
    end
  end
end
