class CustomerContact < ApplicationRecord
  belongs_to :insure_trad_supp
  validates :last_name_contact, :last_name_correspondance, :last_name_dirigeant, :position_contact, :position_correspondance, :position_dirigeant, :email_contact, :email_correspondance, :email_dirigeant, :tel_contact, :tel_correspondance, :tel_dirigeant, presence: true
end
