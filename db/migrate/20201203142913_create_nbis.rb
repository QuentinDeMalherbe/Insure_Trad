class CreateNbis < ActiveRecord::Migration[6.0]
  def change
    create_table :nbis do |t|
      t.integer :montant_min
      t.integer :garantie_1_6_z_1
      t.integer :garantie_1_6_z_2
      t.integer :garantie_1_6_z_3
      t.integer :garantie_7_z_1
      t.integer :garantie_7_z_2
      t.integer :garantie_7_z_3
      t.integer :plafond_annuel_garantie_z_1
      t.integer :plafond_annuel_garantie_z_2
      t.integer :plafond_annuel_garantie_z_3
      t.integer :nbr_client_risque_z_1
      t.integer :nbr_client_risque_z_2
      t.integer :nbr_client_risque_z_3
      t.integer :prime_annuelle_1
      t.integer :cout_police_1
      t.integer :plafond_annuelle_option
      t.integer :cumul_annuel_3
      t.integer :cumul_annuel_2
      t.integer :cumul_annuel_1
      t.integer :franchise_cumulee
      t.integer :garantie_auto
      t.integer :prime_annuelle_option
      t.integer :cout_police_option
      t.references :police_xol, null: false, foreign_key: true
      t.timestamps
    end
  end
end
