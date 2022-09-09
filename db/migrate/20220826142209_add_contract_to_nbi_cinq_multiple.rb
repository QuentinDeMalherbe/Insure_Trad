class AddContractToNbiCinqMultiple < ActiveRecord::Migration[6.0]
  def change
    add_reference :nbi_cinq_multiples, :contract, null: true, foreign_key: true
  end
end
