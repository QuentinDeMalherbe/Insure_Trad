class AddNbiMultipleCinqToCustomerContact < ActiveRecord::Migration[6.0]
  def change
    add_reference :customer_contacts, :nbi_cinq_multiple, null: true, foreign_key: true
  end
end
