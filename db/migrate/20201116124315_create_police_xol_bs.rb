class CreatePoliceXolBs < ActiveRecord::Migration[6.0]
  def change
    create_table :police_xol_bs do |t|
      t.integer :amount_ca_export_b
      t.integer :amount_ca_export_c
      t.integer :client_number
      t.integer :delai_max
      t.integer :dso
      t.references :police_xol, null: false, foreign_key: true
      t.timestamps
    end
  end
end
