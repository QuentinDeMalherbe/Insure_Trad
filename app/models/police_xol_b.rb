class PoliceXolB < ApplicationRecord
  belongs_to :police_xol
  has_many :main_customer_bs, inverse_of: :police_xol_b
  accepts_nested_attributes_for :main_customer_bs, reject_if: lambda {|attributes| attributes['name'].blank?}
  has_many :historic_losses_bs, inverse_of: :police_xol_b
  accepts_nested_attributes_for :historic_losses_bs, reject_if: lambda {|attributes| attributes['amount_loss'].blank?}
  validate :require_one_historic, :require_one_main_customer


CAB = [
  [ 300000, "1€ à 500.000 €"],
  [ 800000, "500.001 à 1.000.000 €"],
  [ 1250000, "1.000.001 à 1.500.000 €"],
  [ 2250000, "1.500.001 à 2.500.000 €"],
  [ 3000000, "2.500.001 à 3.500.000 €"],
  [ 4500000, "3.500.001 à 5.000.000 €"],
  [ 6250000, "5.000.001 à 6.500.000 €"],
  [ 7500000, "6.500.001 à 8.000.000 €"],
  [ 9500000, "9 000 001 à 10 000 000 €"],
  [ 00000, "SI > 10m, tarification manuelle"]
]

CAC = [
  [ 300000, "1€ à 500.000 €"],
  [ 800000, "500.001 à 1.000.000 €"],
  [ 1250000, "1.000.001 à 1.500.000 €"],
  [ 1750000, "1.500.001 à 2.000.000 €"],
  [ 2750000, "2.000.001 à 3.000.000 €"],
  [ 3750000, "3.000.001 à 4.000.000 €"],
  [ 4750000, "4.000.001 à 5.000.000 €"],
  [ 5750000, "5.000.001 à 6.000.000 €"],
  [ 6750000, "6 000 001 à 7 000 000 €"],
  [ 00000, "SI > 7m, tarification manuelle"]
]

NUMBER = [
  [1, "up to 5"],
  [5, "6 to 10"],
  [10, "11 to 20"],
  [20, "21  to 35"],
  [40, "35 to 50"],
  [70, "51 to 75"],
  [125, "76 to 100"],
  [300, "> 101"]
]

  private
    def require_one_historic
      errors.add(:base, "You must provide at least one historic") if historic_losses_bs.size < 1
    end
    def require_one_main_customer
      errors.add(:base, "You must provide at least one customer") if main_customer_bs.size < 1
    end
end

