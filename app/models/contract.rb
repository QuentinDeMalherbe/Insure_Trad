class Contract < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  has_one :police_cinq_million
  has_one :insure_trad_supps
  has_one :nbi_cinq_multiple
  has_one :police_xol
  validates :insure_trade_type , presence: true
  INSURETRADTYPE = [['0', "Assurance des Impayés pour les artisans,commerçants, TPE/PMI : chiffre d'affaire jusquà 5 millions €", 'Bad Debts insurance for Smes up to € 5 million turnover'],
  ['1', "Assurance des Impayés pour les PME : chiffre d'affaire entre  5 et 25 millions €", "Bad Debts insurance for medium size firms between  € 5 and 25 million turnover"],
  ['2', 'Assurance des impayés en couverture de second rang', 'Bad debts Insurance secondary coverage']]
end
