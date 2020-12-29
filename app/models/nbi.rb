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

end
