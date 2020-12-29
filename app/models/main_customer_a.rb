class MainCustomerA < ApplicationRecord
  belongs_to :police_xol

  # t.string "name"
  # t.string "address"
  # t.integer "zip_code"
  # t.string "city"
  # t.string "country"
  # t.string "siret"
  # t.integer "percent_ca"

  def equivalent_ca
    if percent_ca.nil?
      0
    else
      (percent_ca * police_xol.total_ca_max).to_f / 1000
    end
  end
end
