class NbiCinqUn < ApplicationRecord
  belongs_to :police_cinq_million

  CLIENT_AND_GRADE = {
    Dupont:	2,
    Brown:	3,
    Martin:	4,
    April:	5,
    Gaudi:	6,
    June:	7,
    July:	7,
    August:	8,
    October: 9,
    November:	10
  }

  CLIENT = [
    'Dupont',
    'Brown',
    'Martin',
    'April',
    'Gaudi',
    'June',
    'July',
    'August',
    'October',
    'November'
  ]

  def self.montant_perte_base(grade, police)
    case grade
    when 1
      police.max_loss
    when 2
      if police.max_loss > 125_000
        125_000
      else
        police.max_loss
      end
    when 3
      if police.max_loss > 100_000
        100_000
      else
        police.max_loss
      end
    when 4
      if police.max_loss > 100_000
        100_000
      else
        police.max_loss
      end
    when 5
      if police.max_loss > 750_000
        50_000
      else
        police.max_loss
      end
    when 6
      if police.max_loss > 35_000
        35_000
      else
        police.max_loss
      end
    when 7
      if police.max_loss > 20_000
        20_000
      else
        police.max_loss
      end
    else
      0
    end
  end

  def self.quotite_base(grade)
    case grade
    when 1..3
      0.9
    when 4..6
      0.85
    when 7
      0.75
    else
      0
    end
  end

  def self.duree_base(grade, langue)
    # quentin pas bon car enregistre des valeurs diff selon les lanquges mais pour le moment ca passe
    case grade
    when 1..3
      if langue == 'fr'
        "12 mois sous réserve de votre accord dans les prochains 5 jours ouvrés"
      elsif langue == 'en'
        "12 months subject to our receipt of your writing binding order within the next 5 business days"
      else
        "12 months subject to our receipt of your writing binding order within the next 5 business days"
      end
    when 4..6
      if langue == 'fr'
        "6 mois sous réserve de votre accord dans les prochains 5 jours ouvrés"
      elsif langue == 'en'
        "6 months subject to our receipt of your writing binding order within the next 5 business days"
      else
        "6 months subject to our receipt of your writing binding order within the next 5 business days"
      end
    when 7
      if langue == 'fr'
        "3  mois sous réserve de votre accord dans les prochains 5 jours ouvrés"
      elsif langue == 'en'
        "3 months subject to our receipt of your writing binding order within the next 5 business days"
      else
        "3 months subject to our receipt of your writing binding order within the next 5 business days"
      end
    else
      if langue == 'fr'
        "Grade de risque insuffisant pour accorder une garantie sur ce client"
      elsif params["locale"] == 'en'
        "Insufficient risk level to grant a guarantee on this buyer"
      else
        "Insufficient risk level to grant a guarantee on this buyer"
      end
    end



  end
  #j4
  def self.montant_perte_complementaire(grade, police)
    case grade
    when 1
      0
    when 2
      if police.max_loss - 125_000 > 24_000
        25_000
      else
        0
      end
    when 3
      if police.max_loss - 100_000 > 24_000
        25_000
      else
        0
      end
    when 4
      if police.max_loss - 75_000 > 24_000
        25_000
      else
        0
      end
    when 5
      if police.max_loss - 50_000 > 24_000
        25_000
      else
        0
      end
    when 6
      if police.max_loss - 35_000 > 14_000
        15_000
      else
        0
      end
    when 7
      if police.max_loss - 20_000 > 9_000
        10_000
      else
        0
      end
    else
      0
    end
  end

  def self.montant_forfait_base(grade, police, montant_perte_base)
    # b12
    # b9
    net_premium_rate = net_prenium_rate(grade).to_f / 1.3
    # b10
    net_adjust = net_premium_rate + net_premium_rate * police.aggravation(police.insured_risk)
    # b11
    if montant_perte_base * net_adjust < 750
      net_falt_annual = 750
    else
      net_falt_annual = montant_perte_base * net_adjust
    end
    # d7
    period_of_coverage = period_of_coverage(grade)
    if period_of_coverage == 12
      return net_falt_annual * 1.3 + 150 + 50
    elsif period_of_coverage == 6
      return (net_falt_annual * 1.3 * 9).to_f / 12 + 150 + 50
    elsif period_of_coverage == 3
      return (net_falt_annual * 1.3 * 6).to_f / 12 + 150 + 50
    elsif period_of_coverage == 0
      return 0
    end
  end


  def self.montant_forfait_complementaire(grade, police)
    # j10
    # b9
    net_premium_rate = net_prenium_rate(grade).to_f / 1.3
    # j4
    montant_perte_complementaire = montant_perte_complementaire(grade, police)
    # j7
    additional_net_premium = montant_perte_complementaire * net_premium_rate * 1.5
    # j8
    additional_net_flat_annual =  additional_net_premium + additional_net_premium * police.aggravation(police.insured_risk)
    # j9
    additional_gross_flat_annual = additional_net_flat_annual *1.3
    # d7
    period_of_coverage = period_of_coverage(grade)
    if period_of_coverage == 12
      return additional_gross_flat_annual * 1.3
    elsif period_of_coverage == 6
      return (additional_gross_flat_annual * 1.3 * 9).to_f / 12
    elsif period_of_coverage == 3
      return (additional_gross_flat_annual * 1.3 * 6).to_f / 12
    elsif period_of_coverage == 0
      return 0
    end
  end

  private
  # d7
  def self.period_of_coverage(grade)
    if grade <= 3
      12
    elsif grade <= 6
      6
    elsif grade == 7
      3
    else
      0
    end
  end
  # b9
  def self.net_prenium_rate(grade)
    case grade
    when 1
      0.0095
    when 2
      0.0115
    when 3
      0.0155
    when 4
      0.0205
    when 5
      0.0235
    when 6
      0.05
    when 7
      0.085
    when 8
      0.15
    when 9
      0.35
    when 10
      0.55
    end
  end
end
