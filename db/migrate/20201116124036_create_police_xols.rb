class CreatePoliceXols < ActiveRecord::Migration[6.0]
  def change
    create_table :police_xols do |t|
      t.integer :amount_ca_nat
      t.integer :amount_ca_nat_else
      t.integer :amount_ca_export_a
      t.integer :client_number
      t.integer :delai_max
      t.integer :dso
      t.references :contract, null: false, foreign_key: true

      t.timestamps
    end
  end
end
