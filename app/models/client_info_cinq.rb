class ClientInfoCinq < ApplicationRecord
  belongs_to :police_cinq_million

  PAIEMENT = [
    ["Jusqu'à 30 jours date de facture", "Up to 30 days from invoice date"],
    ["Jusqu'à 60 jours date de facture", "Up to 60 days from invoice date"],
    ["Jusqu'à 75 jours date de facture", "Up to 75 days from invoice date"],
    ["Jusqu'à 90 jours date de facture", "Up to 90 days from invoice date"],
    ["Jusqu'à 120 jours date de facture", "Up to 120 days from invoice date"],
    ["Plus de 120 jours date de facture", "More than 30 days from invoice date"]
  ]

  ANCIENNETE = [
    ["Nouveau  Client", "New customer"],
    ["< 1 an", "< 1 an"],
    ["entre 1 et  2  ans", "between 1 and 2 years"],
    ["entre 2 et  5  ans", "between 2 and 5 years"],
    ["plus de 5 ans", "more than 5 years"]
  ]

  REGULARITE = [
    ["Au moins 1 livraison par semaine", "At least 1 delivery per week"],
    ["Au moins 1 livraison par mois", "At least 1 delivery per month"],
    ["Au moins 1 livraison par trimestre", "At least 1 delivery per trimester"],
    ["Au moins 1 livraison tous les 6 mois", "At least 1 delivery every 6 months"],
    ["Irrégulier", "Irregular"]
  ]

  EXPERIENCE = [
    ["Ponctuel", "Punctual"],
    ["Parfois des retards", "Sometimes delays"],
    ["Souvent en retard ", "Often late"],
    ["Mauvais payeur", "Bad payer"]
  ]

  OUINON = [
    ["Oui", "Yes"],
    ["Non", "No"]
  ]
end
