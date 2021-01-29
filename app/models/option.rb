class Option < ApplicationRecord
  belongs_to :insure_trad_supp

  # ici tableau constructeur !!
  # exporter les tableau de risque : pays , deaprtement et industrie
  #  pour cela exporter et mettre dans la base de données avec un seed !! et les contruires a partir de la base !
  #  ou les faire a la main mais pas besoin des phrases et faire que des hash !!


  def policy_admin_creation
    return POLICYADMFEE + annual_fee
  end

  def cumul_loses_insureds_and_max_auto_losss
    if self.insure_trad_supp.amountCA <= 5000000
      return options = {
        option1: {
          cumul_loses_insured1: 500000,
          max_auto_indiv_insured_loss1: 200000,
          quatre1: 175000,
          trois1: 150000,
          deux1: 100000,
          un1: 75000,
          cumul1: 175000 *0.85 + 150000 *0.80 + 100000 * 0.75 + 75000 * 0.7,
          annual_prenium1: (175000 *0.85 + 150000 *0.80 + 100000 * 0.75 + 75000 * 0.7) * gross_rate_policy_limit
        },
        option2: {
          cumul_loses_insured2: 800000,
          max_auto_indiv_insured_loss2: 250000,
          quatre2: 300000,
          trois2: 250000,
          deux2: 150000,
          un2: 100000,
          cumul2: 300000 *0.85 + 250000 *0.80 + 150000 * 0.75 + 100000 * 0.7,
          annual_prenium2: (300000 *0.85 + 250000 *0.80 + 150000 * 0.75 + 100000 * 0.7) * gross_rate_policy_limit
        },
        option3: {
          cumul_loses_insured3: 1000000,
          max_auto_indiv_insured_loss3: 350000,
          quatre3: 390000,
          trois3: 300000,
          deux3: 185000,
          un3: 125000,
          cumul3: 390000 *0.85 + 300000 *0.80 + 185000 * 0.75 + 125000 * 0.7,
          annual_prenium3: (390000 *0.85 + 300000 *0.80 + 185000 * 0.75 + 125000 * 0.7) * gross_rate_policy_limit
        }
      }
    elsif self.insure_trad_supp.amountCA <= 15000000
      return options = {
        option1: {
          cumul_loses_insured1: 800000,
          max_auto_indiv_insured_loss1: 250000,
          quatre1: 300000,
          trois1: 250000,
          deux1: 150000,
          un1: 100000,
          cumul1: 300000 *0.85 + 250000 *0.80 + 150000 * 0.75 + 100000 * 0.7,
          annual_prenium1: (300000 *0.85 + 250000 *0.80 + 150000 * 0.75 + 100000 * 0.7) * gross_rate_policy_limit
        },
        option2: {
          cumul_loses_insured2: 1000000,
          max_auto_indiv_insured_loss2: 350000,
          quatre2: 390000,
          trois2: 300000,
          deux2: 185000,
          un2: 125000,
          cumul2: 390000 *0.85 + 300000 *0.80 + 185000 * 0.75 + 125000 * 0.7,
          annual_prenium2: (390000 *0.85 + 300000 *0.80 + 185000 * 0.75 + 125000 * 0.7) * gross_rate_policy_limit
        },
        option3: {
          cumul_loses_insured3: 1500000,
          max_auto_indiv_insured_loss3: 450000,
          quatre3: 590000,
          trois3: 450000,
          deux3: 280000,
          un3: 180000,
          cumul3: 590000 *0.85 + 450000 *0.80 + 280000 * 0.75 + 180000 * 0.7,
          annual_prenium3: (590000 *0.85 + 450000 *0.80 + 280000 * 0.75 + 180000 * 0.7) * gross_rate_policy_limit
        }
      }
    elsif self.insure_trad_supp.amountCA <= 35000000
      return options = {
        option1: {
          cumul_loses_insured1: 1000000,
          max_auto_indiv_insured_loss1: 350000,
          quatre1: 390000,
          trois1: 300000,
          deux1: 185000,
          un1: 125000,
          cumul1: 390000 *0.85 + 300000 *0.80 + 185000 * 0.75 + 125000 * 0.7,
          annual_prenium1: (390000 *0.85 + 300000 *0.80 + 185000 * 0.75 + 125000 * 0.7) * gross_rate_policy_limit
        },
        option2: {
          cumul_loses_insured2: 1500000,
          max_auto_indiv_insured_loss2: 450000,
          quatre2: 590000,
          trois2: 450000,
          deux2: 280000,
          un2: 180000,
          cumul2: 590000 *0.85 + 450000 *0.80 + 280000 * 0.75 + 180000 * 0.7,
          annual_prenium2: (590000 *0.85 + 450000 *0.80 + 280000 * 0.75 + 180000 * 0.7) * gross_rate_policy_limit
        },
        option3: {
          cumul_loses_insured3: 2000000,
          max_auto_indiv_insured_loss3: 500000,
          quatre3: 800000,
          trois3: 600000,
          deux3: 350000,
          un3: 250000,
          cumul3: 800000 *0.85 + 600000 *0.80 + 350000 * 0.75 + 250000 * 0.7,
          annual_prenium3: (800000 *0.85 + 600000 *0.80 + 350000 * 0.75 + 250000 * 0.7) * gross_rate_policy_limit
        }
      }
    elsif self.insure_trad_supp.amountCA <= 50000000
      return options = {
        option1: {
          cumul_loses_insured1: 1500000,
          max_auto_indiv_insured_loss1: 450000,
          quatre1: 590000,
          trois1: 450000,
          deux1: 280000,
          un1: 180000,
          cumul1: 590000 *0.85 + 450000 *0.80 + 280000 * 0.75 + 180000 * 0.7,
          annual_prenium1: (590000 *0.85 + 450000 *0.80 + 280000 * 0.75 + 180000 * 0.7) * gross_rate_policy_limit
        },
        option2: {
          cumul_loses_insured2: 2000000,
          max_auto_indiv_insured_loss2: 500000,
          quatre2: 800000,
          trois2: 600000,
          deux2: 350000,
          un2: 250000,
          cumul2: 800000 *0.85 + 600000 *0.80 + 350000 * 0.75 + 250000 * 0.7,
          annual_prenium2: (800000 *0.85 + 600000 *0.80 + 350000 * 0.75 + 250000 * 0.7) * gross_rate_policy_limit
        },
        option3: {
          cumul_loses_insured3: 2500000,
          max_auto_indiv_insured_loss3: 550000,
          quatre3: 900000,
          trois3: 800000,
          deux3: 480000,
          un3: 320000,
          cumul3: 900000 *0.85 + 800000 *0.80 + 480000 * 0.75 + 320000 * 0.7,
          annual_prenium3: (900000 *0.85 + 800000 *0.80 + 480000 * 0.75 + 320000 * 0.7) * gross_rate_policy_limit
        }
      }
    else self.insure_trad_supp.amountCA > 50000000
      return options = {
        option1: {
          cumul_loses_insured1: 2000000,
          max_auto_indiv_insured_loss1: 500000,
          quatre1: 800000,
          trois1: 600000,
          deux1: 350000,
          un1: 250000,
          cumul1: 800000 *0.85 + 600000 *0.80 + 350000 * 0.75 + 250000 * 0.7,
          annual_prenium1: (800000 *0.85 + 600000 *0.80 + 350000 * 0.75 + 250000 * 0.7) * gross_rate_policy_limit
        },
        option2: {
          cumul_loses_insured2: 2500000,
          max_auto_indiv_insured_loss2: 550000,
          quatre2: 900000,
          trois2: 800000,
          deux2: 480000,
          un2: 320000,
          cumul2: 900000 *0.85 + 800000 *0.80 + 480000 * 0.75 + 320000 * 0.7,
          annual_prenium2: (900000 *0.85 + 800000 *0.80 + 480000 * 0.75 + 320000 * 0.7) * gross_rate_policy_limit
        },
        option3: {
          cumul_loses_insured3: 3000000,
          max_auto_indiv_insured_loss3: 600000,
          quatre3: 1050000,
          trois3: 900000,
          deux3: 650000,
          un3: 400000,
          cumul3: 1050000 *0.85 + 900000 *0.80 + 650000 * 0.75 + 400000 * 0.7,
          annual_prenium3: (1050000 *0.85 + 900000 *0.80 + 650000 * 0.75 + 400000 * 0.7) * gross_rate_policy_limit
        }
      }
    end
  end

  private

  RISKS = { very_low:	70, low:	60, good:	50, neutral:	40, weak:	20, high:	10}
  ZIPCODERISKS = { '46' => 70, '35' => 60, '33' => 50, '78' => 40, '17' => 20, '44' => 10 }
  COUNTRYRISKS = { 'France' => 40, 'Spain' => 40 }
  INDUSTRYRISKS = {
    '01' => 40,
    '10' => 20,
    '23' => 50,
    '33' => 20,
    '39' => 10,
    '62' => 40
  }
  POLICYADMFEE = 100
  BUYERFEE = 30

  def credit_risk_environnement
    country_weight = 0.2
    zip_code_weight = 0.2
    industry_weight = 0.6
    zip_code = self.insure_trad_supp.contract.customer.zip_code.to_s
    country = self.insure_trad_supp.contract.customer.country.capitalize
    activity_code = self.insure_trad_supp.contract.customer.activity_code.to_s
    return credit_risk_environnement = ZIPCODERISKS[zip_code] * zip_code_weight
                                      + COUNTRYRISKS[country] * country_weight
                                      + INDUSTRYRISKS[activity_code] * industry_weight
  end

  def max_number_insured_buyer
    return (self.insure_trad_supp.numberTotalInsured * self.insure_trad_supp.percentBadlyCovert).ceil
  end

  def annual_fee
    if (max_number_insured_buyer * 0.3) < 5
      return BUYERFEE * 5
    else
      return ((max_number_insured_buyer * 0.3) * 5).ceil
    end
  end

  def gross_rate_policy_limit
    buyer_score = credit_risk_environnement
    ratio = 0.6
    if buyer_score <= 10
      return ratio* 0.15
    elsif buyer_score <= 13
      return ratio* 0.11
    elsif buyer_score <= 15
      return ratio* 0.09
    elsif buyer_score <= 20
      return ratio* 0.0714
    elsif buyer_score <= 25
      return ratio* 0.0585
    elsif buyer_score <= 30
      return ratio* 0.05
    elsif buyer_score <= 35
      return ratio* 0.0435
    elsif buyer_score <= 45
      return ratio* 0.0355
    elsif buyer_score <= 50
      return ratio* 0.0325
    elsif buyer_score <= 55
      return ratio* 0.031
    elsif buyer_score <= 60
      return ratio* 0.0295
    elsif buyer_score <= 65
      return ratio* 0.028
    elsif buyer_score <= 70
      return ratio* 0.0265
    elsif buyer_score <= 75
      return ratio* 0.025
    else
      return ratio* 0.0235
    end
  end
end
