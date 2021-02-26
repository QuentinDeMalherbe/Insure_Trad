class AddColumnsToNbiCinqUn < ActiveRecord::Migration[6.0]
  def change
    add_column :nbi_cinq_uns, :grade, :string
    add_column :nbi_cinq_uns, :montant_perte_base, :string
    add_column :nbi_cinq_uns, :quotite_base, :string
    add_column :nbi_cinq_uns, :duree_base, :string
    add_column :nbi_cinq_uns, :montant_perte_complementaire, :string
    add_column :nbi_cinq_uns, :montant_forfait_base, :string
    add_column :nbi_cinq_uns, :montant_forfait_complemmentaire, :string
  end
end
