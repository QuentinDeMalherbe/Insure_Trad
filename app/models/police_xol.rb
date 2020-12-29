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
    [1, '< 15.000' ],
    [1, '15.001 to 25.000' ],
    [1, '25.001 to 50.000' ],
    [1, '50.001 to 75.000' ],
    [1, '75.001 to 100.000' ],
    [1, '100.001 to 150.000' ],
    [1, '150.001 to 200.000' ],
    [1, '200.001 to 250.000' ],
    [1, '250.001 to 300.000' ],
    [1, '300.001 to 400.000' ],
    [1, '400.001 to 500.000' ],
    [1, '500.001 to 750.000' ],
    [1, '750.001 to 1.000.000' ],
    [1, '> 1.000.001' ]
  ]


  MAX_LOSS = [
    [1, '< 15.000' ],
    [1, '15.001 to 25.000' ],
    [1, '25.001 to 50.000' ],
    [1, '50.001 to 75.000' ],
    [1, '75.001 to 100.000' ],
    [1, '100.001 to 150.000' ],
    [1, '150.001 to 200.000' ],
    [1, '200.001 to 250.000' ],
    [1, '250.001 to 300.000' ],
    [1, '300.001 to 400.000' ],
    [1, '400.001 to 500.000' ],
    [1, '500.001 to 750.000' ],
    [1, '750.001 to 1.000.000' ],
    [1, '> 1.000.001' ]
  ]

  NUMBER_CLIENT = [
    [ 1, '0 to 2' ],
    [ 1, '3 to 6' ],
    [ 1, '7 to 10' ],
    [ 1, '11 to 15' ],
    [ 1, '16 to 20' ],
    [ 1, '21 to 25' ],
    [ 1, '> 25' ]
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

  private

  def require_one_historic
    errors.add(:base, "You must provide at least one historic") if historic_losses_as.size < 1
  end

  def require_one_main_customer
    errors.add(:base, "You must provide at least one customer") if main_customer_as.size < 1
  end
end
