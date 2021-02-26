class CreateClientInfoCinqs < ActiveRecord::Migration[6.0]
  def change
    create_table :client_info_cinqs do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :zip_code
      t.string :num_identification
      t.string :terme_paiement
      t.string :anciennete
      t.string :regularite
      t.string :experience
      t.string :facture_impayee
      t.references :police_cinq_million, null: false, foreign_key: true

      t.timestamps
    end
  end
end
