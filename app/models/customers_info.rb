class CustomersInfo < ApplicationRecord
  belongs_to :insure_trad_supp, optional: true
  belongs_to :police_cinq_million, optional: true
  validates :legalForm, :saleInsured, :compagny_name, :address, :zip_code, :city, :country, :activity_code, :siret, presence: true
end
