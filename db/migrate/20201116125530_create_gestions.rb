class CreateGestions < ActiveRecord::Migration[6.0]
  def change
    create_table :gestions do |t|
      t.string :cgi
      t.string :logiciel
      t.string :document
      t.string :client_info
      t.string :client_solvabilite
      t.string :client_limit
      t.string :calcul_client_limit
      t.string :limit_time_payback
      t.references :police_xol, null: false, foreign_key: true

      t.timestamps
    end
  end
end
