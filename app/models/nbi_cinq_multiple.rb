class NbiCinqMultiple < ApplicationRecord
  belongs_to :police_cinq_million

  def self.impaye(police)
    # F4
    (police.max_loss * 0.3).to_f / 6
  end

  def self.cumul_impaye(impaye)
    impaye * 5
  end

  def self.franchise_option_2(impaye)
    impaye * 0.5
  end

  def self.franchise_option_3(impaye)
    impaye * 0.8
  end

  def self.grade_risque(client_number)
    case client_number
    when 5
      3
    when 10
      6
    when 20
      10
    when 40
      20
    when 70
      35
    when 125
      50
    when 300
      75
    else
      0
    end
  end

  def self.prime_annuelle_1(police, plafond_annuel)
    if police.ammount_ca * percent_amount_ca(police.ammount_ca) < percent_customer(police) * 0.04 * plafond_annuel
      percent_customer(police) * 0.04 * plafond_annuel
    else
      police.ammount_ca * percent_amount_ca(police.ammount_ca)
    end
  end

  private

  def self.percent_customer(police)
    customer = police.contract.customer.compagny_name
    case customer
    when 'Alfatec Sistemas'
      1.15
    when 'VELORCIOS SL'
      1.3
    when 'METALURGIA GALAICA '
      1
    when 'Pophin'
      1.3
    when 'Mialon et fils'
      1.5
    when 'Emergence Agro'
      1
    end
  end

  def self.percent_amount_ca(amount)
    case amount
    when 100_000
      0.0108
    when 250_000
      0.0085
    when 500_000
      0.008
    when 1_000_000
      0.005
    when 1_500_000
      0.0042
    when 2_000_000
      0.0038
    when 3_000_000
      0.0035
    when 4_000_000
      0.003
    when 5_000_000
      0.0025
    else

    end
  end
end


