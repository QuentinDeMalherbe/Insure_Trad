class CreateCustomerContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_contacts do |t|
      t.string :last_name_contact
      t.string :last_name_dirigeant
      t.string :last_name_correspondance
      t.string :position_contact
      t.string :position_dirigeant
      t.string :position_correspondance
      t.string :email_dirigeant
      t.string :email_contact
      t.string :email_correspondance
      t.string :tel_contact
      t.string :tel_dirigeant
      t.string :tel_correspondance
      t.references :insure_trad_supp, foreign_key: true

      t.timestamps
    end
  end
end
