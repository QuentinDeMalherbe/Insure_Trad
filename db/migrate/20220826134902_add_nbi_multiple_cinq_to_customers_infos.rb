class AddNbiMultipleCinqToCustomersInfos < ActiveRecord::Migration[6.0]
  def change
    add_reference :customers_infos, :nbi_cinq_multiple, null: true, foreign_key: true
  end
end
