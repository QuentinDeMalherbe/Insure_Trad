class CreateMainCustomerBs < ActiveRecord::Migration[6.0]
  def change
    create_table :main_customer_bs do |t|
      t.string :name
      t.string :address
      t.integer :zip_code
      t.string :city
      t.string :country
      t.string :siret
      t.integer :percent_ca
      t.references :police_xol_b, null: false, foreign_key: true

      t.timestamps
    end
  end
end
