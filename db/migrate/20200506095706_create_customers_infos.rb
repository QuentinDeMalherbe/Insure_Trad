class CreateCustomersInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :customers_infos do |t|
      t.string :legalForm
      t.text :saleInsured
      t.string :compagny_name
      t.string :address
      t.integer :zip_code
      t.string :city
      t.string :country
      t.integer :activity_code
      t.string :siret
      t.references :insure_trad_supp, foreign_key: true

      t.timestamps
    end
  end
end
