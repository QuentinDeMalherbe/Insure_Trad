class CreateLossPayees < ActiveRecord::Migration[5.2]
  def change
    create_table :loss_payees do |t|
      t.string :name
      t.string :address
      t.integer :zipcode
      t.string :city
      t.string :country
      t.references :primary_insurance, foreign_key: true

      t.timestamps
    end
  end
end
