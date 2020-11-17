class PoliceXol < ApplicationRecord
  belongs_to :contract
  has_one :police_xol_b
  has_one :gestion
  has_many :main_customer_as, inverse_of: :police_xol
  accepts_nested_attributes_for :main_customer_as, reject_if: lambda {|attributes| attributes['name'].blank?}
  has_many :historic_losses_as, inverse_of: :police_xol
  accepts_nested_attributes_for :historic_losses_as, reject_if: lambda {|attributes| attributes['amount_loss'].blank?}
  validate :require_one_historic, :require_one_main_customer


  CA = [
    [ 1, "1.000.000 à 2.500.000 €"],
    [ 1, "2.500.001 à 5.000.000 €"],
    [ 1, "5.000.001 à 7.500.000 €"],
    [ 1, "7.500.001 à 10.000.000 €"],
    [ 1, "10.000.001 à 12.500.000 €"],
    [ 1, "12.500.001 à 15.000.000 €"],
    [ 1, "15.000.001 à 17.500.000 €"],
    [ 1, "17.500.001 à 20.000.000 €"]
  ]

  CA_DOM = [
    [ 1, "1€ à 500.000 €"],
    [ 1, "500.001 à 1.000.000 €"],
    [ 1, "1.000.001 à 1.500.000 €"],
    [ 1, "1.500.001 à 2.500.000 €"],
    [ 1, "2.500.001 à 3.500.000 €"],
    [ 1, "3.000.001 à 5.000.000 €"],
    [ 1, "5.000.001 à 7.000.000 €"],
    [ 1, "7.000.001 à 10.000.000 €"],
    [ 1, "10 000 001 à 13 000 000 €"],
    [ 1, "13 000 001 à 15 000 000 €"]
  ]

  CA_EXPORT = [
    [1, "1 à 1.000.000 €"],
    [1, "1.000.001 à 2.000.000 €"],
    [1, "2.000.001 à 3.000.000 €"],
    [1, "3.000.001 à 4.000.000 €"],
    [1, "4.000.001 à 5.000.000 €"],
    [1, "5.000.001 à 7.000.000 €"],
    [1, "7.000.001 à 9.000.000 €"],
    [1, "9.000.001 à 11.000.000 €"],
    [1, "11.000.001 à13.000.000 €"],
    [1, "13.000.001 à 15.000.000 €"]
  ]

  NUMBER = [
    [ 1, "up to 15"],
    [ 1, "16 to 30"],
    [ 1, "31 to 50"],
    [ 1, "51  to 75"],
    [ 1, "75 to 100"],
    [ 1, "100 to 150"],
    [ 1, "150 to 250"],
    [ 1, "> 251"]
  ]

DELAI = [
  [ 1, "jusqu'à 30 jours"],
  [ 1, "jusqu'à 60 jours"],
  [ 1, "jusqu'à 90 jours"],
  [ 1, "jusqu'à 120 jours"],
  [ 1, "jusqu'à 180 jours"],
  [ 1, "> 180 jours"]

]

DSO = [
  [1, "< 30 jours"],
  [1, "entre 30 et 45 jours"],
  [1, "entre 46 et 55 jours"],
  [1, "entre 56 et 60 jours"],
  [1, "entre 61 et 65 jours"],
  [1, "entre 66 et 70 jours"],
  [1, "entre 71 et 75 jours"],
  [1, "entre 76 et 80 jours"],
  [1, "entre 81 et 95 jours"],
  [1, "> 95 jours"]
]
private

    def require_one_historic
      errors.add(:base, "You must provide at least one historic") if historic_losses_as.size < 1
    end
    def require_one_main_customer
      errors.add(:base, "You must provide at least one customer") if main_customer_as.size < 1
    end
end
