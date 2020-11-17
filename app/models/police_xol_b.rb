class PoliceXolB < ApplicationRecord
  belongs_to :police_xol
  has_many :main_customer_bs
  has_many :historic_losses_bs
end
