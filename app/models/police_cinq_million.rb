class PoliceCinqMillion < ApplicationRecord
  belongs_to :contract
  has_one :nbi_cinq_un
  has_one :nbi_cinq_multiple
  has_one :client_info_cinq
  has_one :customer_contact
  CA = [
    [100_000, '< 100.000', '< 100.000'],
    [250_000, '100.001 € à 250.000 €', '100.001 € to 250.000 €'],
    [500_000, '250.001 € à 500.000 €', '250.001 € to 500.000 €'],
    [1_000_000, '500.001 € à 1.000.000 €', '500.001 € to 1.000.000 €'],
    [1_500_000, '1.000.001 € à 1.500.000 €', '1.000.001 € to 1.500.000 €'],
    [2_000_000, '1.500.001 € à 2.000.000 €', '1.500.001 € to 2.000.000 €'],
    [3_000_000, '2.000.001 € à 3.000.000 €', '2.000.001 € to 3.000.000 €'],
    [4_000_000, '3.000.001 € à 4.000.000 €', '3.000.001 € to 4.000.000 €'],
    [5_000_000, '4.000.001 € à 5.000.000 €', '4.000.001 € to 5.000.000 €']
  ]

  NUMBERCLIENT = [
  [1, '1', '1'],
  [5, '2 à 5', '2 to 5'],
  [10, '6 à 15', '6 to 15'],
  [20, '16 à 30', '16 to 30'],
  [40, '31 à 50', '31 to 50'],
  [70, ' 51  à 100', '51 to 100'],
  [125, '101 à 250', '101 to 250'],
  [300, '> 251', '> 251']
  ]

  MAXLOSS = [
  2_000,
  3_500,
  5_000,
  7_500,
  10_000,
  15_000,
  20_000,
  25_000,
  30_000,
  40_000,
  50_000,
  75_000,
  100_000,
  125_000,
  150_000
  ]

  def insured_risk
    coeff_year_in_business = 0.3
    coeff_turnover  = 0.1
    coeff_turnover_growth  = 0.1
    coeff_dso = 0.15
    coeff_bad_debt = 0.2
    coeff_crc_credit_rating = 0.15
    #  il a plusieurs info par defaut dans le factor_insured attention
    # attention dans formules il ya des conditions pas réalisé
    return coeff_year_in_business * risk_year_in_business(contract.customer.creation_date)
      + coeff_turnover * turnover_risk(ammount_ca)
      + coeff_turnover_growth * 30
      + coeff_dso * 30
      + coeff_bad_debt * 20
      + coeff_crc_credit_rating * 40
      #  a arrondir sup
  end

  # f28
  def aggravation(risk)
    case risk
    when 0..6
      0.4
    when 7..10
      0.3
    when 11..13
      0.25
    when 14..15
      0.2
    when 16..20
      0.15
    when 21..25
      0.1
    when 26..40
      0
    when 41..50
      -0.05
    when 51..60
      -0.1
    when 61..70
      -0.15
    when 71..100
      -0.2
    end
  end

    private

  def risk_year_in_business(date)
    # pas tres precis , a ameliorer
    age = Time.now.year - date.year
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

  def turnover_risk(ca)
    case ca
    when 75_000..500_000
      20
    when 600_000..1_000_000
      30
    when 1_100_000..2_000_000
      40
    when 2_100_000..3_000_000
      50
    else
      60
    end
  end
end
