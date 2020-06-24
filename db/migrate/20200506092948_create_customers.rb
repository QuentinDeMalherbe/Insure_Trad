class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :compagny_name
      t.string :address
      t.integer :zip_code
      t.string :city
      t.string :country
      t.integer :activity_code
      t.string :siret

      t.timestamps
    end
  end
end


