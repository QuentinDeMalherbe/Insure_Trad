class AddClientNameToNbiCinqUns < ActiveRecord::Migration[6.0]
  def change
    add_column :nbi_cinq_uns, :client_name, :string
  end
end
