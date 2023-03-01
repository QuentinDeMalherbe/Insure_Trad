class Consumer < ApplicationRecord
  belongs_to :customer
  include PgSearch::Model

  pg_search_scope :name_search,
  against: [:name],
  using: {
    tsearch: { prefix: true }
  }

  pg_search_scope :siret_search,
  against: [:siret],
  using: {
    tsearch: { prefix: true }
  }
end
