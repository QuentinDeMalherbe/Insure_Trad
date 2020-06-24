class InsureTradSupp < ApplicationRecord
  belongs_to :contract
  has_one :customer_contact
  has_one :customers_info
  has_one :primary_insurance
  has_one :option

  PERCENTS = [[0.1, 'moins de 10%'], [0.15, '11 % à 15 %'], [0.2, '16 % à 20 %'], [0.25, '20 % à 25 %'], [0.3, '26 % à 30 %'], [0, 'plus de  30 %']]
  CLIENTS =   [[20, 'moins de 25'], [35, '26 à 50'], [60, '51 à 75'], [85, '76 à 100'], [130, '101 à 150'], [185, '151 à 200'], [250, '200 à 300'], [400, 'plus de 301']]
  validates :amountCA, :percentBadlyCovert, :percentCA, :numberTotalInsured, presence: true
end
