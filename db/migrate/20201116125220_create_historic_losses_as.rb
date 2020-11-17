class CreateHistoricLossesAs < ActiveRecord::Migration[6.0]
  def change
    create_table :historic_losses_as do |t|
      t.date :start_date
      t.date :end_date
      t.integer :amount_loss
      t.integer :number_client
      t.integer :max_loss
      t.references :police_xol, null: false, foreign_key: true

      t.timestamps
    end
  end
end
