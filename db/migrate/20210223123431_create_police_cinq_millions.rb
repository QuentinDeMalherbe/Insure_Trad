class CreatePoliceCinqMillions < ActiveRecord::Migration[6.0]
  def change
    create_table :police_cinq_millions do |t|
      t.references :contract, null: false, foreign_key: true
      t.integer :ammount_ca
      t.integer :client_number
      t.integer :max_loss

      t.timestamps
    end
  end
end
