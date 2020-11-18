class CreateGestions < ActiveRecord::Migration[6.0]
  def change
    create_table :gestions do |t|
      t.integer :cgi
      t.integer :logiciel
      t.integer :document
      t.integer :client_info
      t.integer :client_solvabilite
      t.integer :client_limit
      t.integer :calcul_client_limit
      t.integer :limit_time_payback
      t.references :police_xol, null: false, foreign_key: true

      t.timestamps
    end
  end
end
