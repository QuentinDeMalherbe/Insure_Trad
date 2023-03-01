class CreateConsumers < ActiveRecord::Migration[6.0]
  def change
    create_table :consumers do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :siret
      t.string :country
      t.string :name
      t.string :address
      t.string :zip_code
      t.string :city

      t.timestamps
    end
  end
end
