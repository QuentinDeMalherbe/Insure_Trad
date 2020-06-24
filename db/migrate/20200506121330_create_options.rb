class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.integer :cumul_loses_insured
      t.integer :max_auto_indiv_insured_loss
      t.integer :annual_prenium
      t.integer :quatrieme_layer
      t.integer :troisieme_layer
      t.integer :deuxieme_layer
      t.integer :premier_layer
      t.integer :policy_admin
      t.references :insure_trad_supp, foreign_key: true

      t.timestamps
    end
  end
end
