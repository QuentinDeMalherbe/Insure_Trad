class AddCustomerContactToPoliceCinqMillionAndDeleteLastMigration < ActiveRecord::Migration[6.0]
  def change
    remove_reference :customers_infos, :nbi_cinq_multiple, null: true, foreign_key: true
    remove_reference :nbi_cinq_multiples, :contract, null: true, foreign_key: true
    remove_reference :customer_contacts, :nbi_cinq_multiple, null: true, foreign_key: true
    add_reference :customers_infos, :police_cinq_million, null: true, foreign_key: true
  end
end
