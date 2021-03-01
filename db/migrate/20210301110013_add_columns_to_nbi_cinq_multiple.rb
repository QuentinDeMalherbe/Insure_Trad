class AddColumnsToNbiCinqMultiple < ActiveRecord::Migration[6.0]
  def change
    add_column :nbi_cinq_multiples, :impaye, :integer
    add_column :nbi_cinq_multiples, :cumul_impaye, :integer
    add_column :nbi_cinq_multiples, :franchise_option, :integer
    add_column :nbi_cinq_multiples, :garantie_1_5, :integer
    add_column :nbi_cinq_multiples, :garantie_6, :integer
    add_column :nbi_cinq_multiples, :garantie_7, :integer
    add_column :nbi_cinq_multiples, :nombre_grade, :integer
    add_column :nbi_cinq_multiples, :plafond_annuel, :integer
    add_column :nbi_cinq_multiples, :prime_annuelle, :integer
    add_column :nbi_cinq_multiples, :cout_police, :integer
    add_column :nbi_cinq_multiples, :minimum_prime, :integer
    add_column :nbi_cinq_multiples, :echeance_mensuelle, :integer
  end
end
