class PrimaryInsurance < ApplicationRecord
  belongs_to :insure_trad_supp
  has_many :loss_payees
  validates :name_insurer, :policy_number, :policy_period_start, :policy_period_end, :intermediaire, :loss_payee, presence: true
  PRIMARYASSURANCE = ['EulerHermes', 'Coface', 'Atradius', 'Groupama', 'AxaCredit', 'Credendo', 'Credit y Caucion', 'Cesce', 'Solunion']
end
