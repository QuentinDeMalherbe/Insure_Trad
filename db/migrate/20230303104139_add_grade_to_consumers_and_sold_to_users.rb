class AddGradeToConsumersAndSoldToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :consumers, :grade, :string
    add_column :users, :solde, :integer
  end
end
