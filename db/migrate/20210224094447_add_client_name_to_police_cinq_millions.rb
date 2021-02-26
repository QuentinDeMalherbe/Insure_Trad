class AddClientNameToPoliceCinqMillions < ActiveRecord::Migration[6.0]
  def change
    add_column :police_cinq_millions, :client_name, :string
  end
end
