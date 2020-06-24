class CreateInsureTradSupps < ActiveRecord::Migration[5.2]
  def change
    create_table :insure_trad_supps do |t|
      t.integer :amountCA
      t.float :percentCA
      t.integer :numberTotalInsured
      t.float :percentBadlyCovert
      t.references :contract, foreign_key: true

      t.timestamps
    end
  end
end
