class CreateNbis < ActiveRecord::Migration[6.0]
  def change
    create_table :nbis do |t|
      t.string :montant_min
      t.integer :garantie_1_6_z_1
      t.integer :garantie_1_6_z_2
      t.integer :garantie_1_6_z_3
      t.integer :garantie_7_z_1
      t.integer :garantie_7_z_2
      t.integer :garantie_7_z_3

      t.references :police_xol, null: false, foreign_key: true
      t.timestamps
    end
  end
end
