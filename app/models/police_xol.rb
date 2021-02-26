class PoliceXol < ApplicationRecord
  belongs_to :contract
  has_one :police_xol_b
  has_one :gestion
  has_one :nbi
  has_many :main_customer_as, inverse_of: :police_xol
  accepts_nested_attributes_for :main_customer_as, reject_if: lambda {|attributes| attributes['name'].blank?}
  has_many :historic_losses_as, inverse_of: :police_xol
  accepts_nested_attributes_for :historic_losses_as, reject_if: lambda {|attributes| attributes['amount_loss'].blank?}
  validate :require_one_historic, :require_one_main_customer

  #  pour les calcul il faut les percent ca ....des 4 main customer

  CA = [
    [ 2000000, "1.000.000 à 2.500.000 €"],
    [ 4000000, "2.500.001 à 5.000.000 €"],
    [ 6500000, "5.000.001 à 7.500.000 €"],
    [ 9000000, "7.500.001 à 10.000.000 €"],
    [ 11500000, "10.000.001 à 12.500.000 €"],
    [ 14000000, "12.500.001 à 15.000.000 €"],
    [ 16500000, "15.000.001 à 17.500.000 €"],
    [ 19000000, "17.500.001 à 20.000.000 €"]
  ]

  CA_DOM = [
    [ 300000, "1 à 500.000 €"],
    [ 800000, "500.001 à 1.000.000 €"],
    [ 1500000, "1.000.001 à 1.500.000 €"],
    [ 3000000, "1.500.001 à 2.500.000 €"],
    [ 4250000, "2.500.001 à 3.500.000 €"],
    [ 6500000, "3.000.001 à 5.000.000 €"],
    [ 8500000, "5.000.001 à 7.000.000 €"],
    [ 9000000, "7.000.001 à 10.000.000 €"],
    [ 12500000, "10 000 001 à 13 000 000 €"],
    [ 14500000, "13 000 001 à 15 000 000 €"]
  ]

  CA_EXPORT = [
    [ 800000, "1 à 1.000.000 €"],
    [ 1500000, "1.000.001 à 2.000.000 €"],
    [ 2500000, "2.000.001 à 3.000.000 €"],
    [ 3500000, "3.000.001 à 4.000.000 €"],
    [ 4500000, "4.000.001 à 5.000.000 €"],
    [ 6500000, "5.000.001 à 7.000.000 €"],
    [ 8500000, "7.000.001 à 9.000.000 €"],
    [ 10500000, "9.000.001 à 11.000.000 €"],
    [ 12500000, "11.000.001 à13.000.000 €"],
    [ 14500000, "13.000.001 à 15.000.000 €"]
  ]

  NUMBER = [
    [ 12, "jusqu'à 15"],
    [ 25, "16 à 30"],
    [ 40, "31 à 50"],
    [ 65, "51  à 76"],
    [ 90, "75 à 100"],
    [ 110, "101 à 125"],
    [ 160, "126 à 175"],
    [ 210, "176 à 225"],
    [ 260, "226 à 275"],
    [ 310, "276 à 325"],
    [ 375, "326 à 400"],
    [ 450, "> 400"]
  ]

  # quenitn delai pas utilisé? pas config en tout cas
  DELAI = [
    [ 1, "jusqu'à 30 jours"],
    [ 1, "jusqu'à 60 jours"],
    [ 1, "jusqu'à 90 jours"],
    [ 1, "jusqu'à 120 jours"],
    [ 1, "jusqu'à 180 jours"],
    [ 1, "> 180 jours"]
  ]

  DSO = [
    [25, "< 30 jours"],
    [40, "entre 30 et 45 jours"],
    [50, "entre 46 et 55 jours"],
    [58, "entre 56 et 60 jours"],
    [63, "entre 61 et 65 jours"],
    [68, "entre 66 et 70 jours"],
    [73, "entre 71 et 75 jours"],
    [78, "entre 76 et 80 jours"],
    [90, "entre 81 et 95 jours"],
    [100, "> 95 jours"]
  ]

  PERCENT_TURNOVER = [
    [ 25, '2,5%'],
    [ 50, '5 %'],
    [ 75, '7,5%'],
    [ 100, '10 %'],
    [ 150, '15 %'],
    [ 200, '20 %'],
    [ 250, '25 %'],
    [ 300, '30 %'],
    [ 400, '40 %'],
    # ici probleme pas def par papa
    [ 500, '> 40 %']
  ]

  CUMUL_LOSS = [
    [0, '0' ],
    [15_000, '< 15.000' ],
    [20_000, '15.001 to 25.000' ],
    [38_000, '25.001 to 50.000' ],
    [68_000, '50.001 to 75.000' ],
    [88_000, '75.001 to 100.000' ],
    [130_000, '100.001 to 150.000' ],
    [180_000, '150.001 to 200.000' ],
    [230_000, '200.001 to 250.000' ],
    [280_000, '250.001 to 300.000' ],
    [360_000, '300.001 to 400.000' ],
    [460_000, '400.001 to 500.000' ],
    [650_000, '500.001 to 750.000' ],
    [900_000, '750.001 to 1.000.000' ],
    [1_100_000, '> 1.000.001' ]
  ]

  MAX_LOSS = [
    [0, '0' ],
    [15_000, '< 15.000' ],
    [20_000, '15.001 to 25.000' ],
    [38_000, '25.001 to 50.000' ],
    [68_000, '50.001 to 75.000' ],
    [88_000, '75.001 to 100.000' ],
    [130_000, '100.001 to 150.000' ],
    [180_000, '150.001 to 200.000' ],
    [230_000, '200.001 to 250.000' ],
    [280_000, '250.001 to 300.000' ],
    [360_000, '300.001 to 400.000' ],
    [460_000, '400.001 to 500.000' ],
    [650_000, '500.001 to 750.000' ],
    [900_000, '750.001 to 1.000.000' ],
    [1_100_000, '> 1.000.001' ]
  ]

  NUMBER_CLIENT = [
    [0, '0'],
    [2, '1 to 3'],
    [5, '4 to 6'],
    [9, '7 to 10'],
    [13, '11 to 15'],
    [18, '16 to 20'],
    [23, '21 to 25'],
    [30, '> 25']
  ]

  RISKS_DENOMME = { very_low:	1.2, low:	1.1, good:	1, neutral:	0.9, weak:	0.7, high:	0.6}
  INDUSTRYRISKS_DENOMME = {
    '01' => 0.9,
    '10' => 0.7,
    '23' => 1,
    '33' => 0.7,
    '39' => 0.6,
    '62' => 0.9
  }

  #  t.integer "amount_ca_nat"
  # t.integer "amount_ca_nat_else"
  # t.integer "amount_ca_export_a"
  # t.integer "client_number"
  # t.integer "delai_max"
  # t.integer "dso"
  def montant_min
    if somme_3_cas(min_array(CA, amount_ca_nat), min_array(CA_DOM, amount_ca_nat_else), min_array(CA_EXPORT, amount_ca_export_a)) < 25000000
      total_ca_min
    else
      false
    end
  end

  def min_array(array, moyenne)
    array.select { |array| array[0] == moyenne}.flatten[1].split(' ')[0].gsub('.','').to_i
  end

  def max_array(array, moyenne)
    array.select { |array| array[0] == moyenne}.flatten[1].split(' ')[2].gsub('.','').to_i
  end

  def total_ca_min
    somme_3_cas(
      min_array(CA, amount_ca_nat),
      min_array(CA_DOM, amount_ca_nat_else),
      min_array(CA_EXPORT, amount_ca_export_a)
    )
  end

  def total_ca_max
    somme_3_cas(
      max_array(CA, amount_ca_nat),
      max_array(CA_DOM, amount_ca_nat_else),
      max_array(CA_EXPORT, amount_ca_export_a)
    )
  end

  def total_ca_moy
    (total_ca_max - total_ca_min)*0.75 + total_ca_min
  end

  def ca_6_client_suivant
    (total_ca_moy*0.75 - somme_main_customer_ca)*0.8
  end

  def encours_10_client
    (ca_6_client_suivant*0.75.to_f / (360*6))*dso
  end

  def encours_1_client
    main_customer_as.order('percent_ca desc').first.equivalent_ca.to_f/360*dso
  end

  def somme_3_cas(num1 = 0, num2 = 0, num3 = 0)
    num1+num2+num3
  end

  def somme(num1, num2 = 0)
    num1 + num2
  end

  def somme_main_customer_ca
    somme = 0
    main_customer_as.each do |c|
      somme += c.equivalent_ca
    end
    return somme
  end

  # J63
  def non_denomme_final
    loi_75_25_nbre_de_clients = client_number * 0.75
    ca_moyen_avec_50_des_clients_suivants_les_25_gros = (total_ca_moy - total_ca_moy * 0.75)/(loi_75_25_nbre_de_clients*0.75)
    encours_moyen_65_des_clients = (ca_moyen_avec_50_des_clients_suivants_les_25_gros*dso).to_f/360
    if encours_moyen_65_des_clients > 75_000
      seuil_non_denomme = 75000
    elsif encours_moyen_65_des_clients > 30_000
      seuil_non_denomme = encours_moyen_65_des_clients
    else
      # faire fonction arrondiur tout les 5 mille
      seuil_non_denomme = 30_000
    end
    if contract.customer.activity_code.nil?
      # faire fonction arrondiur tout les 5 mille
      return RISKS_DENOMME[:good] * seuil_non_denomme * gestion.percent_non_denomme
    else
      #  faire les tableaux complet en version final
      activity_code = contract.customer.activity_code.to_s
      # faire fonction arrondiur tout les 5 mille
      return INDUSTRYRISKS_DENOMME[activity_code] * seuil_non_denomme * gestion.percent_non_denomme
    end
  end

# ICI FAIT JUSTE POUR L'EXEMPLE CE SERA A COMPLETER
  RISKS = { very_low:	80, low:	70, good:	60, neutral:	40, weak:	20, high:	10}
  ZIPCODERISKS = { '46' => 70, '35' => 60, '33' => 40, '78' => 40, '17' => 20, '44' => 10 }
  COUNTRYRISKS = { 'France' => 40, 'Spain' => 50 }
  INDUSTRYRISKS_ZONE_1 = {
    '01' => 40,
    '10' => 20,
    '23' => 50,
    '33' => 20,
    '39' => 10,
    '62' => 40
  }
  INDUSTRYRISKS_ZONE_2 = {
    '01' => 40,
    '10' => 20,
    '23' => 20,
    '33' => 10,
    '39' => 10,
    '62' => 20
  }

  def credit_risk_environnement_zone_1
    country_weight = 0.2
    zip_code_weight = 0.1
    industry_weight = 0.7
    zip_code = self.contract.customer.zip_code.to_s
    country = self.contract.customer.country.capitalize
    activity_code = self.contract.customer.activity_code.to_s
    return ZIPCODERISKS[zip_code] * zip_code_weight
          + COUNTRYRISKS[country] * country_weight
          + INDUSTRYRISKS[activity_code] * industry_weight
  end

  def credit_risk_environnement_zone_2
    country_weight = 0.2
    zip_code_weight = 0.1
    industry_weight = 0.7
    zip_code = self.contract.customer.zip_code.to_s
    country = self.contract.customer.country.capitalize
    activity_code = self.contract.customer.activity_code.to_s
    INDUSTRYRISKS_ZONE_2[activity_code] >= INDUSTRYRISKS_ZONE_1[activity_code] ? risk_industry = INDUSTRYRISKS_ZONE_1[activity_code] : risk_industry = INDUSTRYRISKS_ZONE_2[activity_code]
    return  ZIPCODERISKS[zip_code] * zip_code_weight
            + COUNTRYRISKS[country] * country_weight
            + risk_industry * industry_weight
  end

  def net_rate_turnover
    buyer_score = credit_risk_environnement_zone_1
    admin_fee = 1.3
    ratio = ((0.75 / 6)/ 100).to_f / admin_fee
    if buyer_score > 75
      ratio * 0.5
    elsif  buyer_score > 70
      ratio * 1
    elsif  buyer_score > 65
      ratio * 1.5
    elsif  buyer_score > 60
      ratio * 2
    elsif  buyer_score > 55
      ratio * 2.5
    elsif  buyer_score > 50
      ratio * 3
    elsif  buyer_score > 45
      ratio * 3.5
    elsif  buyer_score > 40
      ratio * 4
    elsif  buyer_score > 35
      ratio * 4.5
    elsif  buyer_score > 30
      ratio * 5
    elsif  buyer_score > 25
      ratio * 5.5
    elsif  buyer_score > 20
      ratio * 6
    elsif  buyer_score > 15
      ratio * 6.5
    elsif  buyer_score > 13
      ratio * 7
    elsif  buyer_score > 10
      ratio * 7.5
    elsif  buyer_score > 7
      ratio * 8
    elsif  buyer_score > 3
      ratio * 8.5
    elsif  buyer_score == 3
      ratio * 9
    elsif  buyer_score > 0
      ratio * 9.5
    elsif  buyer_score == 0
      ratio * 10
    end
  end

  def net_rate_turnover_zone_2
    buyer_score = credit_risk_environnement_zone_2
    admin_fee = 1.3
    ratio = ((0.75 / 6)/ 100).to_f / admin_fee
    if buyer_score > 75
      ratio * 0.5
    elsif  buyer_score > 70
      ratio * 1
    elsif  buyer_score > 65
      ratio * 1.5
    elsif  buyer_score > 60
      ratio * 2
    elsif  buyer_score > 55
      ratio * 2.5
    elsif  buyer_score > 50
      ratio * 3
    elsif  buyer_score > 45
      ratio * 3.5
    elsif  buyer_score > 40
      ratio * 4
    elsif  buyer_score > 35
      ratio * 4.5
    elsif  buyer_score > 30
      ratio * 5
    elsif  buyer_score > 25
      ratio * 5.5
    elsif  buyer_score > 20
      ratio * 6
    elsif  buyer_score > 15
      ratio * 6.5
    elsif  buyer_score > 13
      ratio * 7
    elsif  buyer_score > 10
      ratio * 7.5
    elsif  buyer_score > 7
      ratio * 8
    elsif  buyer_score > 3
      ratio * 8.5
    elsif  buyer_score == 3
      ratio * 9
    elsif  buyer_score > 0
      ratio * 9.5
    elsif  buyer_score == 0
      ratio * 10
    end
  end

  def insured_risk
    coeff_year_in_business = 0.2
    coeff_credit_management  = 0.35
    coeff_dso = 0.15
    coeff_crc_credit_rating = 0.3
    year_in_business = risk_year_in_business(contract.customer.creation_date)
    crc_credit_rating = 40
    return coeff_year_in_business * year_in_business
      + coeff_credit_management * gestion.score
      + coeff_dso *  self.dso_score
      + coeff_crc_credit_rating * crc_credit_rating
  end

  def insured_risk_aggravation
    case insured_risk
    when 71..100
      -0.2
    when 61..70
      -0.15
    when 51..60
      -0.1
    when 41..50
      -0.05
    when 31..40
      0
    when 26..30
      0.05
    when 21..25
      0.1
    when 16..20
      0.15
    when 14..15
      0.2
    when 11..13
      0.25
    when 7..10
      0.3
    when 0..6
      0.4
    end
  end

  def dso_score
    if dso == 25
      80
    elsif dso == 40
      75
    elsif dso == 50
      65
    elsif dso == 58
      50
    elsif dso == 63
      40
    elsif dso == 68
      30
    elsif dso == 73
      20
    elsif dso == 78
      10
    elsif dso == 90
      5
    elsif dso == 110
      0
    end
  end

  def revised_risk_aggravation_zone_1
    net_rate_turnover + net_rate_turnover * insured_risk_aggravation
  end

  def self.historics
    now = Date.today
    return {
      historic_1: {
        start_date: Date.new(now.year, 1, 1),
        end_date: now
      },
      historic_2: {
        start_date: Date.new(now.year - 1, 1, 1),
        end_date: Date.new(now.year - 1, 12, 31)
      },
      historic_3: {
        start_date: Date.new(now.year - 2, 1, 1),
        end_date: Date.new(now.year - 2, 12, 31)
      },
      historic_4: {
        start_date: Date.new(now.year - 3, 1, 1),
        end_date: Date.new(now.year - 3, 12, 31)
      }
    }
  end

  private

  def risk_year_in_business(date)
    # pas tres precis , a ameliorer
    age = Time.now.year  - date.year
    if age > 25
      70
    elsif age > 20
      60
    elsif age > 15
      50
    elsif age > 12
      40
    elsif age > 8
      30
    elsif age > 5
      20
    elsif age > 3
      10
    elsif age >= 0
      5
    end
  end

  def require_one_historic
    errors.add(:base, "You must provide at least one historic") if historic_losses_as.size < 1
  end

  def require_one_main_customer
    errors.add(:base, "You must provide at least one customer") if main_customer_as.size < 1
  end
end
