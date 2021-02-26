class ClientInfoCinq < ApplicationRecord
  belongs_to :police_cinq_million

  PAIEMENT = [
    "Jusqu'à 30 jours date de facture",
    "Jusqu'à 60 jours date de facture",
    "Jusqu'à 75 jours date de facture",
    "Jusqu'à 90 jours date de facture",
    "Jusqu'à 120 jours date de facture",
    "Plus de 120 jours date de facture"
  ]

  ANCIENNETE = [
    "Nouveau  Client",
    "< 1 an",
    "entre 1 et  2  ans",
    "entre 2 et  5  ans",
    "plus de 5 ans"
  ]

  REGULARITE = [
    "Au moins 1 livraison par semaine",
    "Au moins 1 livraison par mois",
    "Au moins 1 livraison par trimestre",
    "Au moins 1 livraison tous les 6 mois",
    "Irrégulier"
  ]

  EXPERIENCE = [
    "Ponctuel",
    "Parfois des retards",
    "Souvent en retard ",
    "Mauvais payeur"
  ]

  OUINON = [
    "Oui",
    "Non"
  ]
end
