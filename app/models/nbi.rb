class Nbi < ApplicationRecord
  belongs_to :police_xol

  def montant_min_intervention(montant)
    if montant*0.0001 < 500
      self.montant_min = 500.to_s
    else
      self.montant_min = (montant*0.0001).to_s
    end
  end

  def garantie_1_a_6_zone_1
    if police_xol.encours_10_client > 250_000 && police_xol.encours_10_client > (police_xol.encours_1_client.to_f / 2)
      250_000
    elsif police_xol.encours_10_client > 100_000
      # ici il faut arrondir au millier supéreur
      police_xol.encours_10_client
    else
      100_000
    end
  end

  def garantie_1_a_6_zone_2
    if police_xol.police_xol_b.amount_ca_export_b.zero? || police_xol.police_xol_b.nil?
      0
    else
      if garantie_1_a_6_zone_1 <= 150_000
        # ici il faut arrondir au millier sup
        garantie_1_a_6_zone_1*0.7
      elsif garantie_1_a_6_zone_1 <= 200_000
        # ici il faut arrondir au millier sup
        garantie_1_a_6_zone_1*0.65
      elsif garantie_1_a_6_zone_1 <= 250_000
        # ici il faut arrondir au millier sup
        garantie_1_a_6_zone_1*0.6
      end
    end
  end

  def garantie_1_a_6_zone_3
    if police_xol.police_xol_b.amount_ca_export_c.zero? || police_xol.police_xol_b.nil?
      0
    elsif garantie_1_a_6_zone_2 * 0.7 < police_xol.non_denomme_final * 2
      #  arrondir sup ici
      garantie_1_a_6_zone_2 * 0.7
    else
      #  arrondir sup ici
      police_xol.non_denomme_final * 2
    end
  end

  def garantie_7_zone_1
    if garantie_1_a_6_zone_1 * 0.35 < police_xol.non_denomme_final * 2 && garantie_1_a_6_zone_1 * 0.35 > police_xol.non_denomme_final * 1.5
      #  arrondir sup ici
      seuil = garantie_1_a_6_zone_1 * 0.35
    else
      seuil = police_xol.non_denomme_final * 2
    end
    if seuil >= 75_000
      return 75_000
    else
      return seuil
    end
  end

  def garantie_7_zone_2
    if garantie_1_a_6_zone_2 * 0.35 < police_xol.non_denomme_final * 1.5 && garantie_1_a_6_zone_2 * 0.35 > police_xol.non_denomme_final
      #  arrondir sup ici
      seuil = garantie_1_a_6_zone_2 * 0.35
    else
      seuil = police_xol.non_denomme_final * 1.5
    end
    if seuil >= 50_000
      return 50_000
    else
      return seuil
    end
  end

  def garantie_7_zone_3
    if police_xol.police_xol_b.amount_ca_export_c.zero? || police_xol.police_xol_b.nil?
      0
    else
      police_xol.non_denomme_final
    end
  end

  def max_turnover_amount_zone_1
    (police_xol.total_ca_moy * 0.75 - police_xol.somme_main_customer_ca) +
    (garantie_1_a_6_zone_1 * 4 * 360 ).to_f / police_xol.dso
  end

  def max_turnover_amount_zone_2
    (police_xol.police_xol_b.amount_ca_export_b-(police_xol.police_xol_b.amount_ca_export_b + police_xol.police_xol_b.amount_ca_export_c))
    +
    ((garantie_1_a_6_zone_2*4).to_f/360)* police_xol.police_xol_b.dso
  end

  def max_turnover_amount_zone_3
    police_xol.police_xol_b.amount_ca_export_c * 0.5
  end

  def plafond_annuel_zone_1
    ( police_xol.net_rate_turnover + police_xol.net_rate_turnover * police_xol.insured_risk_aggravation ) * max_turnover_amount_zone_1 * 40
  end

  def plafond_annuel_zone_2
    #  erreur papa ici : b 32
    # max_turnover_amount_zone_2*B32*40
  end

  def plafond_annuel_zone_3
    max_turnover_amount_zone_3 * 0.1 * 40
  end

  def nbr_client_ac_grade_insure_zone_1
    police_xol.client_number * 0.25
  end

  def nbr_client_ac_grade_insure_zone_2
    police_xol.police_xol_b.client_number * 0.25
  end

  def nbr_client_ac_grade_insure_zone_3
    if police_xol.police_xol_b.amount_ca_export_c.positive?
      nbr_client_ac_grade_insure_zone_2 * 0.5
    else
      0
    end
  end

  def prime_ht_annuelle
    somme =
    ( police_xol.net_rate_turnover + police_xol.net_rate_turnover * police_xol.insured_risk_aggravation ) * max_turnover_amount_zone_1
    +
    (police_xol.net_rate_turnover_zone_2 + police_xol.net_rate_turnover_zone_2 * police_xol.insured_risk_aggravation) * max_turnover_amount_zone_2
    # ici erreur b32 plutot g32 non? j'ai fait avec g32 du coup a verifier
    +
    max_turnover_amount_zone_3 * 0.01

    return somme.to_f / 0.75
  end

  def cout_police_frais_annexe_ht
    nbr_client_ac_grade_insure_zone_1 * 30 + police_xol.police_xol_b.client_number * 0.25 * 75 + nbr_client_ac_grade_insure_zone_3 * 150 + 100
  end

  def total_forfaitaire
    prime_ht_annuelle + cout_police_frais_annexe_ht
  end

  # partie 2

  # b51 c51 D51 E51 enregistrée dans data
  def total_sinistres_par_annee(annee)
    # annee = 0,1,2,3  0 etant l'année la plus récente
    police_xol.historic_losses_as.order(start_date: :desc).offset(annee).first.amount_loss +
    police_xol.police_xol_b.historic_losses_bs.order(start_date: :desc).offset(annee).first.amount_loss
  end

  # b52 c52 D52 E52 enregistrée dans data
  def nombre_sinistre_annee(annee)
    # annee = 0,1,2,3  0 etant l'année la plus récente
    police_xol.historic_losses_as.order(start_date: :desc).offset(annee).first.number_client +
    police_xol.police_xol_b.historic_losses_bs.order(start_date: :desc).offset(annee).first.number_client
  end

  # b53 c53 d53 e53 enregistrée dans data
  def plus_gros_sinistre_zone_a_annee(annee)
    # annee = 0,1,2,3  0 etant l'année la plus récente
    police_xol.historic_losses_as.order(start_date: :desc).offset(annee).first.max_loss
  end

  # b54 c54 d54 e54 enregistrée dans data
  def plus_gros_sinistre_zone_b_c_annee(annee)
    # annee = 0,1,2,3  0 etant l'année la plus récente
    police_xol.police_xol_b.historic_losses_bs.order(start_date: :desc).offset(annee).first.max_loss
  end

  # b55 c55 d55 e55
  def plus_gros_sinistre_annee(annee)
    # annee = 0,1,2,3  0 etant l'année la plus récente
    symbol = "annee_#{annee}".to_sym
    return @plus_gros_sinistre_zone_a_annee[symbol] > @plus_gros_sinistre_zone_b_c_annee[symbol] ? @plus_gros_sinistre_zone_a_annee[symbol] : @plus_gros_sinistre_zone_b_c_annee[symbol]
  end

  # b58 C58 D58 E58
  def perte_moyenne_sinistre_sans_gros_sinistre(annee)
    # (b51 -b55) / b52 - 1)
    # ICI PROBLEME DIVISION PAR 0 MAIS APRES SI PA SDE SINISTRE YA 0 CALCUL NORMALEMENT
    symbol = "annee_#{annee}".to_sym
    nombre_sinistre_moins_1 = @nombre_sinistre_annee[symbol] - 1 > 0 ? @nombre_sinistre_annee[symbol] : 1
    (@total_sinistres_par_annee[symbol] - @total_sinistres_par_annee[symbol]).to_f / nombre_sinistre_moins_1
  end

  # b71 et j68 enregistrée dans data
  def calcul_plafond_non_denomme_multiplicateur
    #  ici verifier les condition d'existence
    historic_losses = police_xol.historic_losses_as
    la_lost_la_plus_forte = 0
    historic_losses.each do |h|
      associated_lost = police_xol.police_xol_b.historic_losses_bs.where("start_date = ?", h.start_date).first
      if h.number_client + associated_lost.number_client > la_lost_la_plus_forte
        la_lost_la_plus_forte = h.number_client + associated_lost.number_client
      end
    end
    return la_lost_la_plus_forte - 1
  end

  def initialize_data
    # b71 et j68
    @calcul_plafond_non_denomme_multiplicateur = calcul_plafond_non_denomme_multiplicateur
    annees = [ :annee_0, :annee_1, :annee_2, :annee_3]
    # b52 c52 D52 E52
    @nombre_sinistre_annee = {}
    annees.each_with_index do |sym, i|
      @nombre_sinistre_annee[sym] = nombre_sinistre_annee(i)
    end
    # b51 c51 D51 E51
    @total_sinistres_par_annee  = {}
    annees.each_with_index do |sym, i|
      @total_sinistres_par_annee[sym] = total_sinistres_par_annee(i)
    end
    # b53 c53 d53 e53
    @plus_gros_sinistre_zone_a_annee = {}
    annees.each_with_index do |sym, i|
      @plus_gros_sinistre_zone_a_annee[sym] = plus_gros_sinistre_zone_a_annee(i)
    end
    # b54 c54 d54 e54
    @plus_gros_sinistre_zone_b_c_annee = {}
    annees.each_with_index do |sym, i|
      @plus_gros_sinistre_zone_b_c_annee[sym] = plus_gros_sinistre_zone_b_c_annee(i)
    end
    # b55 c55 d55 e55
    @plus_gros_sinistre_annee = {}
    annees.each_with_index do |sym, i|
      @plus_gros_sinistre_annee[sym] = plus_gros_sinistre_annee(i)
    end
  end

  # b60
  def perte_moyenne_par_sinistre_sans_plus_grosse_sinistre_et_sans_plus_grosse_perte
    # b58 c 58 d 58 e 58
    annees = [0, 1, 2, 3]
    if perte_moyenne_sinistre_sans_gros_sinistre(annees[3]) < perte_moyenne_sinistre_sans_gros_sinistre(annees[2]) &&  perte_moyenne_sinistre_sans_gros_sinistre(annees[3]) < perte_moyenne_sinistre_sans_gros_sinistre(annees[1])
      partie1  = perte_moyenne_sinistre_sans_gros_sinistre(annees[3])
    elsif perte_moyenne_sinistre_sans_gros_sinistre(annees[3]) < perte_moyenne_sinistre_sans_gros_sinistre(annees[0])
      partie1  = perte_moyenne_sinistre_sans_gros_sinistre(annees[3])
    else
      partie1  = perte_moyenne_sinistre_sans_gros_sinistre(annees[0])
    end
    if perte_moyenne_sinistre_sans_gros_sinistre(annees[2]) < perte_moyenne_sinistre_sans_gros_sinistre(annees[1])
      partie2 = perte_moyenne_sinistre_sans_gros_sinistre(annees[2])
    elsif perte_moyenne_sinistre_sans_gros_sinistre(annees[2]) < perte_moyenne_sinistre_sans_gros_sinistre(annees[0])
      partie2  = perte_moyenne_sinistre_sans_gros_sinistre(annees[2])
    else
      partie2  = perte_moyenne_sinistre_sans_gros_sinistre(annees[0])
    end
    if perte_moyenne_sinistre_sans_gros_sinistre(annees[1]) < perte_moyenne_sinistre_sans_gros_sinistre(annees[0])
      partie3 = perte_moyenne_sinistre_sans_gros_sinistre(annees[1])
    else
      partie3 = perte_moyenne_sinistre_sans_gros_sinistre(annees[0])
    end
    return (partie1 + partie2 + partie3).to_f / 3
  end

  # b67
  def perte_la_plus_importante
    # voir avec papa, j'ai fait un max global plutot que sa méthode, a verifier avec lui
  annees = [0, 1, 2, 3]
  annees_symbols = [:annee_0, :annee_1, :annee_2, :annee_3]
  return annees_symbols.map { |sym| @total_sinistres_par_annee[sym] - @plus_gros_sinistre_annee[sym]}.max
end

# b69
def nbr_moyen_sinistre_sans_plus_gros_sinistre_sans_pire_annee
  annees = [0, 1, 2, 3]
  annees_symbols = [:annee_0, :annee_1, :annee_2, :annee_3]
    # b57 c57 D57 E57
    nbr_sinistres_moins_un_par_annee = annees_symbols.map { |sym| @nombre_sinistre_annee[sym] - 1}
    # f50
    now = Date.today
    nbr_de_mois_n_0 = (Date.today - Date.new(now.year, 1, 1)).to_f / 30
    #  f51
    age_of_customer = (Date.today - police_xol.contract.customer.creation_date).to_f / 365
    n_3 = @total_sinistres_par_annee[:annee_3] && age_of_customer >= 4 ? 12 : 0
    n_2 = @total_sinistres_par_annee[:annee_2] && age_of_customer >= 3 ? 12 : 0
    n_1 = @total_sinistres_par_annee[:annee_1] && age_of_customer >= 2 ? 12 : 0
    somme_mois = n_3 + n_2 + n_1 + nbr_de_mois_n_0
    # b69
    if (nbr_sinistres_moins_un_par_annee[3] > nbr_sinistres_moins_un_par_annee[2]) && (nbr_sinistres_moins_un_par_annee[3] > 0)
      part_1 =  nbr_sinistres_moins_un_par_annee[2]
    elsif nbr_sinistres_moins_un_par_annee[3] == 0
      part_1 =  nbr_sinistres_moins_un_par_annee[2]
    else
      part_1 = nbr_sinistres_moins_un_par_annee[3]
    end
    if (nbr_sinistres_moins_un_par_annee[3] > nbr_sinistres_moins_un_par_annee[1]) && (nbr_sinistres_moins_un_par_annee[3] > 0)
      part_2 = nbr_sinistres_moins_un_par_annee[1]
    elsif  nbr_sinistres_moins_un_par_annee[3] == 0
      part_2 = nbr_sinistres_moins_un_par_annee[1]
    else
      part_2 = nbr_sinistres_moins_un_par_annee[3]
    end
    if nbr_sinistres_moins_un_par_annee[3] > nbr_sinistres_moins_un_par_annee[0]
      part_3 = nbr_sinistres_moins_un_par_annee[0]
    else
      part_3 = nbr_sinistres_moins_un_par_annee[2]
    end
    return (part_1 + part_2 + part_3)*12.to_f / (somme_mois - 12)
  end

  # j69
  def calcul_plafond_non_denomme_montant
    #  arrondir au millier sup
    #  b60 j68 b67 j63
    # les conditions sont pas optimisees  non?
    if (perte_moyenne_par_sinistre_sans_plus_grosse_sinistre_et_sans_plus_grosse_perte * @calcul_plafond_non_denomme_multiplicateur < perte_la_plus_importante) && (perte_la_plus_importante > 6 * police_xol.non_denomme_final)
      6 * police_xol.non_denomme_final
    elsif  perte_moyenne_par_sinistre_sans_plus_grosse_sinistre_et_sans_plus_grosse_perte * @calcul_plafond_non_denomme_multiplicateur > 6 * police_xol.non_denomme_final
      perte_moyenne_par_sinistre_sans_plus_grosse_sinistre_et_sans_plus_grosse_perte * @calcul_plafond_non_denomme_multiplicateur
    else
      6 * police_xol.non_denomme_final
    end
  end

  # j71 l71 et m71
  def plafond_annuel_option_1_2_et_3
    #  arrondir au dixiemme de millier sup
    if (calcul_plafond_non_denomme_montant < @calcul_plafond_non_denomme_multiplicateur * police_xol.non_denomme_final ) && (calcul_plafond_non_denomme_montant < perte_la_plus_importante)
      calcul_plafond_non_denomme_montant
    elsif  (perte_la_plus_importante > @calcul_plafond_non_denomme_multiplicateur * police_xol.non_denomme_final) && (calcul_plafond_non_denomme_montant < perte_la_plus_importante)
      calcul_plafond_non_denomme_montant
    else
      police_xol.non_denomme_final * @calcul_plafond_non_denomme_multiplicateur
    end
  end

  # b63
  def moyenne_annuelle_nd
    annees = [0, 1, 2, 3]
    # f50
      now = Date.today
      nbr_de_mois_n_0 = (Date.today - Date.new(now.year, 1, 1)).to_f / 30
    #  f51
      age_of_customer = (Date.today - police_xol.contract.customer.creation_date).to_f / 365
      n_3 = @total_sinistres_par_annee[:annee_3] && age_of_customer >= 4 ? 12 : 0
      n_2 = @total_sinistres_par_annee[:annee_2] && age_of_customer >= 3 ? 12 : 0
      n_1 = @total_sinistres_par_annee[:annee_1] && age_of_customer >= 2 ? 12 : 0
      somme_mois = n_3 + n_2 + n_1 + nbr_de_mois_n_0
    # b56 c56 d56 e56
      annee_3 = (@total_sinistres_par_annee[:annee_3] - @plus_gros_sinistre_annee[:annee_3])
      annee_2 = (@total_sinistres_par_annee[:annee_2] - @plus_gros_sinistre_annee[:annee_2])
      annee_1 = (@total_sinistres_par_annee[:annee_1] - @plus_gros_sinistre_annee[:annee_1])
      annee_0 = (@total_sinistres_par_annee[:annee_0] - @plus_gros_sinistre_annee[:annee_0])
    # b63
    return ((annee_3 + annee_2 + annee_1 + annee_0).to_f / somme_mois)*12
  end

  # b64
  def moyenne_annuelle_nd_sans_plus_mauvaise_annee
    annees = [0, 1, 2, 3]
    # f50
    now = Date.today
    nbr_de_mois_n_0 = (Date.today - Date.new(now.year, 1, 1)).to_f / 30
    #  f51
    age_of_customer = (Date.today - police_xol.contract.customer.creation_date).to_f / 365
    n_3 = @total_sinistres_par_annee[:annee_3] && age_of_customer >= 4 ? 12 : 0
    n_2 = @total_sinistres_par_annee[:annee_2] && age_of_customer >= 3 ? 12 : 0
    n_1 = @total_sinistres_par_annee[:annee_1] && age_of_customer >= 2 ? 12 : 0
    somme_mois = n_3 + n_2 + n_1 + nbr_de_mois_n_0
    # b 64
    annee_3 = (@total_sinistres_par_annee[:annee_3]- @plus_gros_sinistre_annee[:annee_3])
    annee_2 = (@total_sinistres_par_annee[:annee_2] - @plus_gros_sinistre_annee[:annee_2])
    annee_1 = (@total_sinistres_par_annee[:annee_1] - @plus_gros_sinistre_annee[:annee_1])
    annee_0 = (@total_sinistres_par_annee[:annee_0] - @plus_gros_sinistre_annee[:annee_0])
    if annee_3 < annee_2 && annee_3 < annee_1
      sum_1 = annee_3
    elsif  annee_3 < annee_0
      sum_1 = annee_3
    else
      sum_1 = annee_0
    end
    if annee_2 < annee_1 && annee_2 < annee_0
      sum_2 = annee_2
    elsif  annee_1 < annee_0
      sum_2 = annee_1
    else
      sum_2 = annee_0
    end
    if annee_1 < annee_0 && annee_2 < annee_0
      sum_3 = annee_1
    else
      sum_3 = annee_0
    end
    return ((sum_1 + sum_2 + sum_3).to_f / (somme_mois - 12)) * 12
  end

  # J73
  def franchise_cumul_option_1
    #  arrondir au milier sup
    result_one = plafond_annuel_option_1_2_et_3 * 0.05
    result_two = moyenne_annuelle_nd_sans_plus_mauvaise_annee * 0.3
    hyp = result_two < result_one ? result_one : result_two
    if hyp < 10_000
      10_000
    elsif  result_two > result_one
      result_two
    else
      result_one
    end
  end

  # L73
  def franchise_cumul_option_2
    #  arrondir au milier sup
    result_one = plafond_annuel_option_1_2_et_3 * 0.1
    result_two = moyenne_annuelle_nd_sans_plus_mauvaise_annee * 0.4
    hyp = result_two < result_one ? result_one : result_two
    if hyp < franchise_cumul_option_1 + 5_000
      franchise_cumul_option_1 + 5_000
    elsif  result_two > result_one
      result_two
    else
      result_one
    end
  end

  # M73
  def franchise_cumul_option_3
    #  arrondir au milier sup
    result_one = plafond_annuel_option_1_2_et_3 * 0.135
    result_two = moyenne_annuelle_nd_sans_plus_mauvaise_annee * 0.5
    hyp = result_two < result_one ? result_one : result_two
    if hyp < franchise_cumul_option_1 + 10_000
      franchise_cumul_option_1 + 10_000
    elsif  result_two > result_one
      result_two
    else
      result_one
    end
  end

  # J74
  def ligme_cumul_annuel_perte_garantie_1_option_1
    (plafond_annuel_option_1_2_et_3 - franchise_cumul_option_1 ) * 0.5
  end

  # L74
  def ligme_cumul_annuel_perte_garantie_1_option_2
    (plafond_annuel_option_1_2_et_3 - franchise_cumul_option_2 ) * 0.4
  end

  # M74
  def ligme_cumul_annuel_perte_garantie_1_option_3
    (plafond_annuel_option_1_2_et_3 - franchise_cumul_option_3 ) * 0.35
  end

  # J75
  def ligme_cumul_annuel_perte_garantie_2_option_1
    (plafond_annuel_option_1_2_et_3 - franchise_cumul_option_1 ) * 0.35
  end

  # L75
  def ligme_cumul_annuel_perte_garantie_2_option_2
    (plafond_annuel_option_1_2_et_3 - franchise_cumul_option_2 ) * 0.3
  end

  # M75
  def ligme_cumul_annuel_perte_garantie_2_option_3
    (plafond_annuel_option_1_2_et_3 - franchise_cumul_option_3 ) * 0.25
  end

    # J76
  def ligme_cumul_annuel_perte_garantie_3_option_1
    # =+J71-(J73+J74+J75)
    plafond_annuel_option_1_2_et_3 - (franchise_cumul_option_1 + ligme_cumul_annuel_perte_garantie_1_option_1 + ligme_cumul_annuel_perte_garantie_2_option_1)
  end
  # L76
  def ligme_cumul_annuel_perte_garantie_3_option_2
    # =+L71-(L73+L74+L75)
    plafond_annuel_option_1_2_et_3 - (franchise_cumul_option_2 + ligme_cumul_annuel_perte_garantie_1_option_2 + ligme_cumul_annuel_perte_garantie_2_option_2)
  end
  # M76
  def ligme_cumul_annuel_perte_garantie_3_option_3
    # =+M71-(M73+M74+M75)
    plafond_annuel_option_1_2_et_3 - (franchise_cumul_option_3 + ligme_cumul_annuel_perte_garantie_1_option_3 + ligme_cumul_annuel_perte_garantie_2_option_3)
  end

  # f77
  def moyenne_annuelle_nd_option_1
    #  F74 + F75 + F76
    # F73
    f_73 = moyenne_annuelle_nd_sans_plus_mauvaise_annee + ((moyenne_annuelle_nd - moyenne_annuelle_nd_sans_plus_mauvaise_annee).to_f / 5) - franchise_cumul_option_1
    f_74 = f_73 >= ligme_cumul_annuel_perte_garantie_1_option_1 ? ligme_cumul_annuel_perte_garantie_1_option_1 * 0.65 : f_73 * 0.65
    if f_73 <= (ligme_cumul_annuel_perte_garantie_1_option_1 + ligme_cumul_annuel_perte_garantie_2_option_1) && f_73 > ligme_cumul_annuel_perte_garantie_1_option_1
      f_75 = (f_73 - ligme_cumul_annuel_perte_garantie_1_option_1) * 0.7
    elsif  f_73 > (ligme_cumul_annuel_perte_garantie_1_option_1 + ligme_cumul_annuel_perte_garantie_2_option_1)
      f_75 = ligme_cumul_annuel_perte_garantie_2_option_1 * 0.7
    else
      f_75 =  0
    end
    if f_73 > (ligme_cumul_annuel_perte_garantie_1_option_1 + ligme_cumul_annuel_perte_garantie_2_option_1) && f_73 <= plafond_annuel_option_1_2_et_3
      f_76 = (f_73 - ligme_cumul_annuel_perte_garantie_1_option_1 - ligme_cumul_annuel_perte_garantie_2_option_1) * 0.75
    elsif f_73 > plafond_annuel_option_1_2_et_3
      f_76 =  ligme_cumul_annuel_perte_garantie_3_option_1 * 0.75
    else
      f_76 = 0
    end
    return f_74 + f_75 + f_76
  end

  # e77
  def moyenne_annuelle_nd_option_2
    # e74 + e75 + e76
    #  e73
    e_73 = moyenne_annuelle_nd_sans_plus_mauvaise_annee + ((moyenne_annuelle_nd - moyenne_annuelle_nd_sans_plus_mauvaise_annee).to_f / 7) - franchise_cumul_option_2
    e_74 = e_73 >= ligme_cumul_annuel_perte_garantie_1_option_2 ? ligme_cumul_annuel_perte_garantie_1_option_2 * 0.65 : e_73 * 0.65
    if e_73 <= (ligme_cumul_annuel_perte_garantie_1_option_2 + ligme_cumul_annuel_perte_garantie_2_option_2) && e_73 > ligme_cumul_annuel_perte_garantie_1_option_2
      e_75 = (e_73 - ligme_cumul_annuel_perte_garantie_1_option_2) * 0.7
    elsif  e_73 > (ligme_cumul_annuel_perte_garantie_1_option_2 + ligme_cumul_annuel_perte_garantie_2_option_2)
      e_75 = ligme_cumul_annuel_perte_garantie_2_option_2 * 0.7
    else
      e_75 =  0
    end
    if e_73 > (ligme_cumul_annuel_perte_garantie_1_option_2 + ligme_cumul_annuel_perte_garantie_1_option_2) && e_73 <= plafond_annuel_option_1_2_et_3
      e_76 = (e_73 - ligme_cumul_annuel_perte_garantie_1_option_2 - ligme_cumul_annuel_perte_garantie_1_option_2) * 0.75
    elsif e_73 > plafond_annuel_option_1_2_et_3
      e_76 =  ligme_cumul_annuel_perte_garantie_3_option_2 * 0.75
    else
      e_76 = 0
    end
    return e_74 + e_75 + e_76
  end

  # d77
  def moyenne_annuelle_nd_option_3
    # d_74 + d_75 + d_77
    # d73
    d_73 = moyenne_annuelle_nd_sans_plus_mauvaise_annee + ((moyenne_annuelle_nd - moyenne_annuelle_nd_sans_plus_mauvaise_annee).to_f / 10) - franchise_cumul_option_3
    d_74 = d_73 >= ligme_cumul_annuel_perte_garantie_1_option_3 ? ligme_cumul_annuel_perte_garantie_1_option_3 * 0.65 : d_73 * 0.65
    if d_73 <= (ligme_cumul_annuel_perte_garantie_1_option_3 + ligme_cumul_annuel_perte_garantie_2_option_3) && d_73 > ligme_cumul_annuel_perte_garantie_1_option_3
      d_75 = (d_73 - ligme_cumul_annuel_perte_garantie_1_option_3) * 0.7
    elsif  d_73 > (ligme_cumul_annuel_perte_garantie_1_option_3 + ligme_cumul_annuel_perte_garantie_2_option_3)
      d_75 = ligme_cumul_annuel_perte_garantie_2_option_3 * 0.7
    else
      d_75 =  0
    end
    if d_73 > (ligme_cumul_annuel_perte_garantie_1_option_3 + ligme_cumul_annuel_perte_garantie_1_option_3) && d_73 <= plafond_annuel_option_1_2_et_3
      d_76 = (d_73 - ligme_cumul_annuel_perte_garantie_1_option_3 - ligme_cumul_annuel_perte_garantie_1_option_3) * 0.75
    elsif d_73 > plafond_annuel_option_1_2_et_3
      d_76 =  ligme_cumul_annuel_perte_garantie_3_option_3 * 0.75
    else
      d_76 = 0
    end
    return d_74 + d_75 + d_76
  end

  # g78
  def indemnisation_percent_option_1
    #  (J74 * 0.65 + J75 * 0.7 + J76 * 0.75) / J71
    (ligme_cumul_annuel_perte_garantie_1_option_1 * 0.65 + ligme_cumul_annuel_perte_garantie_2_option_1 * 0.7 + ligme_cumul_annuel_perte_garantie_3_option_1 * 0.75).to_f / plafond_annuel_option_1_2_et_3
  end

  # k78
  def indemnisation_percent_option_2
    #  (L74 * 0.65 + L75 * 0.7 + L76 * 0.75) / L71
    (ligme_cumul_annuel_perte_garantie_1_option_2 * 0.65 + ligme_cumul_annuel_perte_garantie_2_option_2 * 0.7 + ligme_cumul_annuel_perte_garantie_3_option_2 * 0.75).to_f / plafond_annuel_option_1_2_et_3
  end

  # o78
  def indemnisation_percent_option_3
    #  (M74 * 0.65 + M75 * 0.7 + M76 * 0.75) / M71
    (ligme_cumul_annuel_perte_garantie_1_option_3 * 0.65 + ligme_cumul_annuel_perte_garantie_2_option_3 * 0.7 + ligme_cumul_annuel_perte_garantie_3_option_3 * 0.75).to_f / plafond_annuel_option_1_2_et_3
  end


  # E 96
  def prime_ht_annuelle_option_1
    ((plafond_annuel_option_1_2_et_3 - moyenne_annuelle_nd_sans_plus_mauvaise_annee) * indemnisation_percent_option_1 * 0.05 * police_xol.gestion.option_1 + moyenne_annuelle_nd_option_1 * 1.15).to_f / 0.75
  end

  # F96
  def prime_ht_annuelle_option_2
    ((plafond_annuel_option_1_2_et_3 - moyenne_annuelle_nd_sans_plus_mauvaise_annee) * indemnisation_percent_option_2 * 0.06 * police_xol.gestion.option_2 + moyenne_annuelle_nd_option_2 * 1.15).to_f / 0.75
  end

  #  G96
  def prime_ht_annuelle_option_3
  ((plafond_annuel_option_1_2_et_3 - moyenne_annuelle_nd_sans_plus_mauvaise_annee) * indemnisation_percent_option_3 * 0.05 * police_xol.gestion.option_3 + moyenne_annuelle_nd_option_3 * 1.15).to_f / 0.75
  end

  # E97
  def cout_police_frais_annexe_option_1_2_3
    # arrondi inf
    100 * nbr_moyen_sinistre_sans_plus_gros_sinistre_sans_pire_annee
  end

end
