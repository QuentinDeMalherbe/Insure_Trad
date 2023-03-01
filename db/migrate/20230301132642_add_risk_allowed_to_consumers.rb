class AddRiskAllowedToConsumers < ActiveRecord::Migration[6.0]
  def change
    add_column :consumers, :risk_allowed, :boolean, default: true
  end
end
