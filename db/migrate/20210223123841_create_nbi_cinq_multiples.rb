class CreateNbiCinqMultiples < ActiveRecord::Migration[6.0]
  def change
    create_table :nbi_cinq_multiples do |t|
      t.references :police_cinq_million, null: false, foreign_key: true

      t.timestamps
    end
  end
end
