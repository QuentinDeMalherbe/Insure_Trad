class LossPayee < ApplicationRecord
  belongs_to :primary_insurance
  validates :name, :address, :zipcode, :city, :country, presence: true
end
