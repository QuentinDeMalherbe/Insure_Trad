class Gestion < ApplicationRecord
  belongs_to :police_xol

  CGI = [
    [6, 'oui'],
    [0, 'non']
  ]

  LOGICIEL = [
    [ 0, "Non, pas de logiciel de gestion permettant de connaitre  l'encours sur chaque client"],
    [ 3, "Oui, équipé d'un logiciel permettant de connaitre mensuellemnt l'encours de chaque client"],
    [ 6, "Oui, équipé d'un logiciel permettant de connaitre chaque semaine l'encours de chaque client"],
    [ 10, "Oui, équipé d'un logiciel permettant de connaitre à tout moment l'encours de chaque client"]
  ]

  DOCUMENT = [
    [ 0, "Uniquement une facture ou un tiquet de caisse"],
    [ 3, "Une commande écrite reçue de votre client/bon de commande/acceptation d'un devis enregistré par vos services et une facture ou un tiquet de caisse"],
    [ 6, "Une commande écrite reçue de votre client/bon de commance/Devis accepté, une facture ou un tiquet de caisse et un bon de livraison signé par votre client"],
    [ 10, "Un contrat signé par vos clients confirmant son acceptation des termes et conditions de la bonne éxécution de toute opération commerciale"]
  ]

  INFO = [
    [ 0, "Jamais"],
    [ 3, "Uniquement sur tout nouveau client"],
    [ 6, "Annuellement sur certains clients"],
    [ 10, "Annuellement sur tous les clients"]
  ]

  SOLVABILITE = [
    [ 0, "Jamais par une société de renseigments"],
    [ 3, "Solvabilité surveillée par une société de renseignements uniquement sur certains clients"],
    [ 6, "Mise à jour de la solvabilité par une société de renseignements au moins une fois par ensemble sur l'ensemble des clients actifs"],
    [ 10, "Ensemble des clients sous surveillance permanent par une société des renseignements"]
  ]

  LIMIT = [
    [ 0, "Jamais"],
    [ 3, "Sur les principaux clients"],
    [ 3, "Sur certains clients"],
    [ 10, "Sur chaque client"]
  ]

  CALCUL = [
    [ 0, "Montant estimé de la limite crédit nécessaire pour couvrir votre projection de chiffre d'affaires avec tout client"],
    [ 3, "Montant estimé de la limite crédit basée sur l'historique de votre flux d'affaires avec chaque client"],
    [ 6, "Votre montant estimé de la limite crédit basée sur un Score/Grade de crédit donné par une société de renseignements"],
    [ 10, "Montant de la limite de crédit maximale recommandé par une société de renseignements"]
  ]

  LIMIT_TIME = [
      [ 0, "dans les 60 jours suivant la date d'échéance initiale restée impayée même partiellement"],
      [ 3, "dans les 30 jours suivant la date d'échéance initiale restée impayée même partiellement"],
      [ 6, "dans les 15 jours suivant la date d'échéance initiale restée impayée même partiellement"],
      [ 10, "immédiatement après votre connaissance de l'impayé"]
  ]

  def total_point
    cgi + logiciel + document + client_info + client_solvabilite + client_limit + calcul_client_limit + limit_time_payback
  end

  def percent_non_denomme
    if total_point <= 20
      0.8
    elsif  total_point <= 35
      0.9
    elsif  total_point <= 50
      1
    elsif  total_point <= 65
      1.1
    else
      1.2
    end
  end

  def score
    if total_point <= 20
      10
    elsif  total_point <= 35
      30
    elsif  total_point <= 50
      40
    elsif  total_point <= 65
      50
    else
      70
    end
  end

  def option_1
    if total_point <= 20
      1.4
    elsif  total_point <= 35
      1.3
    elsif  total_point <= 50
      1.2
    elsif  total_point <= 65
      1.1
    else
      1
    end
  end

  def option_2
    if total_point <= 20
      1.2
    elsif  total_point <= 35
      1.1
    elsif  total_point <= 50
      1
    elsif  total_point <= 65
      0.9
    else
      0.8
    end
  end

  def option_3
    if total_point <= 20
      1
    elsif  total_point <= 35
      0.9
    elsif  total_point <= 50
      0.8
    elsif  total_point <= 65
      0.7
    else
      0.6
    end
  end
end
    # t.integer "cgi"
    # t.integer "logiciel"
    # t.integer "document"
    # t.integer "client_info"
    # t.integer "client_solvabilite"
    # t.integer "client_limit"
    # t.integer "calcul_client_limit"
    # t.integer "limit_time_payback"

