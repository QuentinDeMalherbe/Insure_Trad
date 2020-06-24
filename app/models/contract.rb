class Contract < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  has_one :insure_trad_supps
  validates :insure_trade_type , presence: true
  INSURETRADTYPE = [['0', 'Police pour entreprise de moins de 5 millions € de chiffre d''affaires annuel'], ['1', 'Police XOL pour entreprise de 5 millions € à 20 millions € de chiffre d''affaires annuel'], ['2', 'Police d\'assurance second rang']]
end
