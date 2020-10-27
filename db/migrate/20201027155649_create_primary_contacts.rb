class CreatePrimaryContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :primary_contacts do |t|
      t.string :last_name
      t.string :first_name
      t.string :position
      t.string :email
      t.string :tel
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
