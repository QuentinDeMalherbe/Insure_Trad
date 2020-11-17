class Customer < ApplicationRecord
  has_many :contracts
  has_many :primarycontacts
  validates :compagny_name, :address, :zip_code, :city, :country, :activity_code, :siret, :creation_date, presence: true
  include PgSearch::Model
  pg_search_scope :search_by_compagny_name_and_siret,
    against: [ :compagny_name, :siret ],
    using: {
      tsearch: { prefix: true }
    }
end
