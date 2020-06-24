class CustomersInfo < ApplicationRecord
  belongs_to :insure_trad_supp
  validates :legalForm, :saleInsured, :compagny_name, :address, :zip_code, :city, :country, :activity_code, :siret, presence: true
end
