class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.integer :seuil
      t.integer :guarantie
      t.integer :guarantie_a
      t.integer :guarantie_b
      t.integer :consultation_number
      t.integer :prime
      t.integer :prime_a
      t.integer :prime_b
      t.integer :reconstitution_1
      t.integer :reconstitution_2
      t.integer :reconstitution_3
      t.integer :g_a_up
      t.integer :g_a_down
      t.integer :prime_up
      t.integer :prime_down
      t.integer :r_1_up
      t.integer :r_1_down
      t.integer :r_2_up
      t.integer :r_2_down
      t.integer :r_3_up
      t.integer :r_3_down
      t.references :user, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
