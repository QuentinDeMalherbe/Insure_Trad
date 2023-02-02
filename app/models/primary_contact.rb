class PrimaryContact < ApplicationRecord
  belongs_to :customer
  validates :last_name, :first_name, :position, :tel, :email, presence: true

  def full_name
    first_name + " " + last_name
  end
end
