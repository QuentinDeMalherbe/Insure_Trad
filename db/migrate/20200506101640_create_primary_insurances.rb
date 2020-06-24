class CreatePrimaryInsurances < ActiveRecord::Migration[5.2]
  def change
    create_table :primary_insurances do |t|
      t.string :name_insurer
      t.integer :policy_number
      t.date :policy_period_start
      t.date :policy_period_end
      t.string :intermediaire
      t.integer :loss_payee
      t.references :insure_trad_supp, foreign_key: true

      t.timestamps
    end
  end
end
