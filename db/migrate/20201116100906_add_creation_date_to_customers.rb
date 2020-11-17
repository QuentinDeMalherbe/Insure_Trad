class AddCreationDateToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :creation_date, :date
  end
end
