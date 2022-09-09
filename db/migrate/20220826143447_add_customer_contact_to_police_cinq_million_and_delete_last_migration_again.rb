class AddCustomerContactToPoliceCinqMillionAndDeleteLastMigrationAgain < ActiveRecord::Migration[6.0]
  def change
    remove_reference :customers_infos, :police_cinq_million, null: true, foreign_key: true
    add_reference :customer_contacts, :police_cinq_million, null: true, foreign_key: true
  end
end
