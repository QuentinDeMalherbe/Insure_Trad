class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.references :user, foreign_key: true
      t.references :customer, foreign_key: true
      t.integer :insure_trade_type

      t.timestamps
    end
  end
end
