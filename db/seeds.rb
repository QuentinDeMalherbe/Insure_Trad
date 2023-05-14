# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating user'
    user_1 = User.new(
      email: 'test@test.com',
      password:'123456',
      status: 'expert'
    )
    user_2 = User.new(
      email: 'alban.demalherbe@gmail.com',
      password:'123456',
      status: 'expert'
    )
    user_3 = User.new(
      email: 'raimon@creditclassification.com',
      password:'123456',
      status: 'expert'
    )
    user_4 = User.new(
      email: 'quentin@assure.com',
      password:'123456',
      status: 'assure'
    )
    user_1.save!
    user_2.save!
    user_3.save!
    user_4.save!
puts 'Creating  6 customers/primary_contacts/contracts/police_cinq_millions/nbi_cinq_multiple'

  # 1 POPHIN
  customer = Customer.new(
    compagny_name:'Alexandre Pophin',
    address: 'Les Buyères',
    zip_code: 37360,
    city: 'Semblacay',
    country: 'France',
    activity_code: 62,
    siret: '4830998679',
    creation_date: '30/12/1899'.to_date
  )
  customer.save!

  quote = Quote.new(
      seuil: 250,
      guarantie: 1250,
      guarantie_a: 4500,
      guarantie_b: 2250,
      consultation_number: 5,
      prime: 1723,
      prime_a: 79,
      prime_b: 53,
      reconstitution_1: 1898,
      reconstitution_2: 2075,
      reconstitution_3: 2254,
      g_a_up: 5500,
      g_a_down: 3000,
      prime_up: 2044,
      r_1_up: 2254,
      r_2_up: 2431,
      r_3_up: 2610,
      prime_down: 1367,
      r_1_down: 1542,
      r_2_down: 1719,
      r_3_down: 1898,
      user_id: user_2.id,
      customer_id: customer.id
  )
  quote.save!

  quote = Quote.new(
      seuil: 250,
      guarantie: 1250,
      guarantie_a: 4500,
      guarantie_b: 2250,
      consultation_number: 5,
      prime: 1723,
      prime_a: 79,
      prime_b: 53,
      reconstitution_1: 1898,
      reconstitution_2: 2075,
      reconstitution_3: 2254,
      g_a_up: 5500,
      g_a_down: 3000,
      prime_up: 2044,
      r_1_up: 2254,
      r_2_up: 2431,
      r_3_up: 2610,
      prime_down: 1367,
      r_1_down: 1542,
      r_2_down: 1719,
      r_3_down: 1898,
      user_id: user_3.id,
      customer_id: customer.id
  )
  quote.save!

  # 2 SARL Bruno Miarlon
  customer = Customer.new(
      compagny_name:'Bruno Miarlon',
      siret: '384397741',
      address: 'Vigne Merle',
      zip_code: 71400,
      city: 'Saint Pierre',
      country: 'France',
      activity_code: 41,
      creation_date: '27/01/1992'.to_date
    )
  customer.save!

  quote = Quote.new(
    seuil: 250,
    guarantie: 1250,
    guarantie_a: 4000,
    guarantie_b: 2000,
    consultation_number: 5,
    prime: 1880,
    prime_a: 70,
    prime_b: 47,
    reconstitution_1: 2120,
    reconstitution_2: 2365,
    reconstitution_3: 2611,
    g_a_up: 5000,
    g_a_down: 3000,
    prime_up: 2165,
    r_1_up: 2436,
    r_2_up: 2680,
    r_3_up: 2927,
    prime_down: 1564,
    r_1_down: 1805,
    r_2_down: 2049,
    r_3_down: 2295,
    user_id: user_2.id,
    customer_id: customer.id
  )
  quote.save!

  quote = Quote.new(
    seuil: 250,
    guarantie: 1250,
    guarantie_a: 4000,
    guarantie_b: 2000,
    consultation_number: 5,
    prime: 1880,
    prime_a: 70,
    prime_b: 47,
    reconstitution_1: 2120,
    reconstitution_2: 2365,
    reconstitution_3: 2611,
    g_a_up: 5000,
    g_a_down: 3000,
    prime_up: 2165,
    r_1_up: 2436,
    r_2_up: 2680,
    r_3_up: 2927,
    prime_down: 1564,
    r_1_down: 1805,
    r_2_down: 2049,
    r_3_down: 2295,
    user_id: user_3.id,
    customer_id: customer.id
  )
  quote.save!

  # 3 Emergence Agro
  customer = Customer.new(
    compagny_name:'Emergence Agro',
    siret: '541186933',
    address: 'ZI Les Vallées',
    zip_code: 50800,
    city: 'Villedieu les Poêles',
    country: 'France',
    activity_code: 46,
    creation_date: '12/06/2002'.to_date
  )
  customer.save!
  quote = Quote.new(
    seuil: 300,
    guarantie: 1500,
    guarantie_a: 7000,
    guarantie_b: 3500,
    consultation_number: 12,
    prime: 3692,
    prime_a: 123,
    prime_b: 82,
    reconstitution_1: 3974,
    reconstitution_2: 4260,
    reconstitution_3: 4549,
    g_a_up: 9000,
    g_a_down: 5000,
    prime_up: 4461,
    r_1_up: 4785,
    r_2_up: 5071,
    r_3_up: 5360,
    prime_down: 2881,
    r_1_down: 3163,
    r_2_down: 3450,
    r_3_down: 3738,
    user_id: user_2.id,
    customer_id: customer.id
  )
  quote.save!

  quote = Quote.new(
    seuil: 300,
    guarantie: 1500,
    guarantie_a: 7000,
    guarantie_b: 3500,
    consultation_number: 12,
    prime: 3692,
    prime_a: 123,
    prime_b: 82,
    reconstitution_1: 3974,
    reconstitution_2: 4260,
    reconstitution_3: 4549,
    g_a_up: 9000,
    g_a_down: 5000,
    prime_up: 4461,
    r_1_up: 4785,
    r_2_up: 5071,
    r_3_up: 5360,
    prime_down: 2881,
    r_1_down: 3163,
    r_2_down: 3450,
    r_3_down: 3738,
    user_id: user_3.id,
    customer_id: customer.id
  )
  quote.save!

  # 4 Sas Boudet
  customer = Customer.new(
    compagny_name:'Sas Boudet',
    siret: '899705156',
    address: 'LD Lascombes',
    zip_code: 15600,
    city: 'Saint Constant Fournoules',
    country: 'France',
    activity_code: 46,
    creation_date: '26/05/2021'.to_date
  )
  customer.save!
  quote = Quote.new(
    seuil: 350,
    guarantie: 2500,
    guarantie_a: 11000,
    guarantie_b: 5500,
    consultation_number: 12,
    prime: 10475,
    prime_a: 193,
    prime_b: 128,
    reconstitution_1: 10905,
    reconstitution_2: 11342,
    reconstitution_3: 11782,
    g_a_up: 13000,
    g_a_down: 9000,
    prime_up: 12406,
    r_1_up: 12898,
    r_2_up: 13335,
    r_3_up: 13775,
    prime_down: 8482,
    r_1_down: 8912,
    r_2_down: 9349,
    r_3_down: 9789,
    user_id: user_2.id,
    customer_id: customer.id
  )
  quote.save!

  quote = Quote.new(
    seuil: 350,
    guarantie: 2500,
    guarantie_a: 11000,
    guarantie_b: 5500,
    consultation_number: 12,
    prime: 10475,
    prime_a: 193,
    prime_b: 128,
    reconstitution_1: 10905,
    reconstitution_2: 11342,
    reconstitution_3: 11782,
    g_a_up: 13000,
    g_a_down: 9000,
    prime_up: 12406,
    r_1_up: 12898,
    r_2_up: 13335,
    r_3_up: 13775,
    prime_down: 8482,
    r_1_down: 8912,
    r_2_down: 9349,
    r_3_down: 9789,
    user_id: user_3.id,
    customer_id: customer.id
  )
  quote.save!

  # 5 Thevenin
  customer = Customer.new(
    compagny_name:'Thevenin',
    siret: '517417648',
    address: 'Rue de l''église',
    zip_code: 21150,
    city: 'Darcey',
    country: 'France',
    activity_code: 01,
    creation_date: '01/04/2009'.to_date
  )
  customer.save!

  quote = Quote.new(
    seuil: 350,
    guarantie: 2500,
    guarantie_a: 11500,
    guarantie_b: 5750,
    consultation_number: 25,
    prime: 8327,
    prime_a: 201,
    prime_b: 134,
    reconstitution_1: 8646,
    reconstitution_2: 8970,
    reconstitution_3: 9297,
    g_a_up: 14000,
    g_a_down: 8500,
    prime_up: 10106,
    r_1_up: 10503,
    r_2_up: 10827,
    r_3_up: 11154,
    prime_down: 6470,
    r_1_down: 6789,
    r_2_down: 7113,
    r_3_down: 7440,
    user_id: user_2.id,
    customer_id: customer.id
  )
  quote.save!


  quote = Quote.new(
    seuil: 350,
    guarantie: 2500,
    guarantie_a: 11500,
    guarantie_b: 5750,
    consultation_number: 25,
    prime: 8327,
    prime_a: 201,
    prime_b: 134,
    reconstitution_1: 8646,
    reconstitution_2: 8970,
    reconstitution_3: 9297,
    g_a_up: 14000,
    g_a_down: 8500,
    prime_up: 10106,
    r_1_up: 10503,
    r_2_up: 10827,
    r_3_up: 11154,
    prime_down: 6470,
    r_1_down: 6789,
    r_2_down: 7113,
    r_3_down: 7440,
    user_id: user_3.id,
    customer_id: customer.id
  )
  quote.save!

  # 6 EURL Zaer Elec
  customer = Customer.new(
    compagny_name:'EURL Zaer Elec',
    siret: '879219624',
    address: '26 route de Royan',
    zip_code: 17600,
    city: 'Saint Romain de Benet',
    country: 'France',
    activity_code: 43,
    creation_date: '10/11/2017'.to_date
  )
  customer.save!
  quote = Quote.new(
    seuil: 400,
    guarantie: 3000,
    guarantie_a: 14500,
    guarantie_b: 7250,
    consultation_number: 25,
    prime: 10978,
    prime_a: 254,
    prime_b: 169,
    reconstitution_1: 11361,
    reconstitution_2: 11750,
    reconstitution_3: 12142,
    g_a_up: 18000,
    g_a_down: 11000,
    prime_up: 13404,
    r_1_up: 13880,
    r_2_up: 14269,
    r_3_up: 14661,
    prime_down: 8459,
    r_1_down: 8842,
    r_2_down: 9230,
    r_3_down: 9622,
    user_id: user_2.id,
    customer_id: customer.id
  )
  quote.save!

  quote = Quote.new(
    seuil: 400,
    guarantie: 3000,
    guarantie_a: 14500,
    guarantie_b: 7250,
    consultation_number: 25,
    prime: 10978,
    prime_a: 254,
    prime_b: 169,
    reconstitution_1: 11361,
    reconstitution_2: 11750,
    reconstitution_3: 12142,
    g_a_up: 18000,
    g_a_down: 11000,
    prime_up: 13404,
    r_1_up: 13880,
    r_2_up: 14269,
    r_3_up: 14661,
    prime_down: 8459,
    r_1_down: 8842,
    r_2_down: 9230,
    r_3_down: 9622,
    user_id: user_3.id,
    customer_id: customer.id
  )
  quote.save!

  # 7 Entreprise Alain Revol
  customer = Customer.new(
    compagny_name:'Entreprise Alain Revol',
    siret: '391708146',
    address: '23 bis rue de Montreuil',
    zip_code: 78000,
    city: 'Versailles',
    country: 'France',
    activity_code: 43,
    creation_date: '30/06/1993'.to_date
  )
  customer.save!
  quote = Quote.new(
    seuil: 400,
    guarantie: 3000,
    guarantie_a: 14000,
    guarantie_b: 7000,
    consultation_number: 12,
    prime: 12695,
    prime_a: 245,
    prime_b: 163,
    reconstitution_1: 13145,
    reconstitution_2: 13601,
    reconstitution_3: 14061,
    g_a_up: 17000,
    g_a_down: 11000,
    prime_up: 15024,
    r_1_up: 15464,
    r_2_up: 15921,
    r_3_up: 16381,
    prime_down: 10375,
    r_1_down: 10825,
    r_2_down: 11281,
    r_3_down: 11741,
    user_id: user_2.id,
    customer_id: customer.id
  )
  quote.save!
  quote = Quote.new(
    seuil: 400,
    guarantie: 3000,
    guarantie_a: 14000,
    guarantie_b: 7000,
    consultation_number: 12,
    prime: 12695,
    prime_a: 245,
    prime_b: 163,
    reconstitution_1: 13145,
    reconstitution_2: 13601,
    reconstitution_3: 14061,
    g_a_up: 17000,
    g_a_down: 11000,
    prime_up: 15024,
    r_1_up: 15464,
    r_2_up: 15921,
    r_3_up: 16381,
    prime_down: 10375,
    r_1_down: 10825,
    r_2_down: 11281,
    r_3_down: 11741,
    user_id: user_3.id,
    customer_id: customer.id
  )
  quote.save!

  # 8 Chantelat SA
  customer = Customer.new(
    compagny_name:'Chantelat SA',
    siret: '378929509',
    address: '2 rue Saint Martin',
    zip_code: 18140,
    city: 'Argenvières',
    country: 'France',
    activity_code: 46,
    creation_date: '01/01/1990'.to_date
  )
  customer.save!
  quote = Quote.new(
    seuil: 450,
    guarantie: 3500,
    guarantie_a: 17000,
    guarantie_b: 8500,
    consultation_number: 25,
    prime: 12147,
    prime_a: 298,
    prime_b: 198,
    reconstitution_1: 12603,
    reconstitution_2: 13603,
    reconstitution_3: 13533,
    g_a_up: 20000,
    g_a_down: 13500,
    prime_up: 14307,
    r_1_up: 14852,
    r_2_up: 15316,
    r_3_up: 15783,
    prime_down: 9898,
    r_1_down: 10254,
    r_2_down: 10817,
    r_3_down: 11284,
    user_id: user_2.id,
    customer_id: customer.id
  )
  quote.save!
  quote = Quote.new(
    seuil: 450,
    guarantie: 3500,
    guarantie_a: 17000,
    guarantie_b: 8500,
    consultation_number: 25,
    prime: 12147,
    prime_a: 298,
    prime_b: 198,
    reconstitution_1: 12603,
    reconstitution_2: 13603,
    reconstitution_3: 13533,
    g_a_up: 20000,
    g_a_down: 13500,
    prime_up: 14307,
    r_1_up: 14852,
    r_2_up: 15316,
    r_3_up: 15783,
    prime_down: 9898,
    r_1_down: 10254,
    r_2_down: 10817,
    r_3_down: 11284,
    user_id: user_3.id,
    customer_id: customer.id
  )
  quote.save!

  # 9 Gueydon
  customer = Customer.new(
    compagny_name:'Gueydon',
    siret: '325347961',
    address: 'ZI Les Blanchisseries',
    zip_code: 38500,
    city: 'Voiron',
    country: 'France',
    activity_code: 40,
    creation_date: '01/09/1982'.to_date
  )
  customer.save!
  quote = Quote.new(
    seuil: 550,
    guarantie: 4000,
    guarantie_a: 20500,
    guarantie_b: 10250,
    consultation_number: 40,
    prime: 11777,
    prime_a: 359,
    prime_b: 239,
    reconstitution_1: 12243,
    reconstitution_2: 12717,
    reconstitution_3: 13194,
    g_a_up: 25500,
    g_a_down: 15500,
    prime_up: 14270,
    r_1_up: 14850,
    r_2_up: 15323,
    r_3_up: 15801,
    prime_down: 9170,
    r_1_down: 9636,
    r_2_down: 10110,
    r_3_down: 10587,
    user_id: user_2.id,
    customer_id: customer.id
  )
  quote.save!
  quote = Quote.new(
    seuil: 550,
    guarantie: 4000,
    guarantie_a: 20500,
    guarantie_b: 10250,
    consultation_number: 40,
    prime: 11777,
    prime_a: 359,
    prime_b: 239,
    reconstitution_1: 12243,
    reconstitution_2: 12717,
    reconstitution_3: 13194,
    g_a_up: 25500,
    g_a_down: 15500,
    prime_up: 14270,
    r_1_up: 14850,
    r_2_up: 15323,
    r_3_up: 15801,
    prime_down: 9170,
    r_1_down: 9636,
    r_2_down: 10110,
    r_3_down: 10587,
    user_id: user_3.id,
    customer_id: customer.id
  )
  quote.save!

  # 10 Librairie Cufay
  customer = Customer.new(
    compagny_name:'Librairie Cufay',
    siret: '324266055',
    address: '1 rue Saint Vulfran',
    zip_code: 80400,
    city: 'Abbeville',
    country: 'France',
    activity_code: 46,
    creation_date: '01/03/1982'.to_date
  )
  customer.save!
  quote = Quote.new(
    seuil: 550,
    guarantie: 4500,
    guarantie_a: 23500,
    guarantie_b: 11750,
    consultation_number: 25,
    prime: 11045,
    prime_a: 411,
    prime_b: 274,
    reconstitution_1: 11479,
    reconstitution_2: 11920,
    reconstitution_3: 12365,
    g_a_up: 30500,
    g_a_down: 16500,
    prime_up: 13961,
    r_1_up: 14523,
    r_2_up: 14965,
    r_3_up: 15409,
    prime_down: 8001,
    r_1_down: 8436,
    r_2_down: 8877,
    r_3_down: 9322,
    user_id: user_2.id,
    customer_id: customer.id
  )
  quote.save!
  quote = Quote.new(
    seuil: 550,
    guarantie: 4500,
    guarantie_a: 23500,
    guarantie_b: 11750,
    consultation_number: 25,
    prime: 11045,
    prime_a: 411,
    prime_b: 274,
    reconstitution_1: 11479,
    reconstitution_2: 11920,
    reconstitution_3: 12365,
    g_a_up: 30500,
    g_a_down: 16500,
    prime_up: 13961,
    r_1_up: 14523,
    r_2_up: 14965,
    r_3_up: 15409,
    prime_down: 8001,
    r_1_down: 8436,
    r_2_down: 8877,
    r_3_down: 9322,
    user_id: user_3.id,
    customer_id: customer.id
  )
  quote.save!

  # 11 Guillemot Olivier Informatique
  customer = Customer.new(
    compagny_name:'Guillemot Olivier Informatique',
    siret: '383995578',
    address: '2 rue du Fief d''Arres',
    zip_code: 49230,
    city: 'Sevremoine',
    country: 'France',
    activity_code: 72,
    creation_date: '01/12/1991'.to_date
  )
  customer.save!
  quote = Quote.new(
    seuil: 650,
    guarantie: 5500,
    guarantie_a: 28000,
    guarantie_b: 14000,
    consultation_number: 70,
    prime: 27483,
    prime_a: 490,
    prime_b: 327,
    reconstitution_1: 28307,
    reconstitution_2: 29144,
    reconstitution_3: 29988,
    g_a_up: 33500,
    g_a_down: 22500,
    prime_up: 32368,
    r_1_up: 33354,
    r_2_up: 34191,
    r_3_up: 35035,
    prime_down: 22436,
    r_1_down: 23261,
    r_2_down: 24098,
    r_3_down: 24941,
    user_id: user_2.id,
    customer_id: customer.id
  )
  quote.save!
  quote = Quote.new(
    seuil: 650,
    guarantie: 5500,
    guarantie_a: 28000,
    guarantie_b: 14000,
    consultation_number: 70,
    prime: 27483,
    prime_a: 490,
    prime_b: 327,
    reconstitution_1: 28307,
    reconstitution_2: 29144,
    reconstitution_3: 29988,
    g_a_up: 33500,
    g_a_down: 22500,
    prime_up: 32368,
    r_1_up: 33354,
    r_2_up: 34191,
    r_3_up: 35035,
    prime_down: 22436,
    r_1_down: 23261,
    r_2_down: 24098,
    r_3_down: 24941,
    user_id: user_3.id,
    customer_id: customer.id
  )
  quote.save!

  # 12 Chaudron
  customer = Customer.new(
    compagny_name:'Chaudron',
    siret: '495285538',
    address: '6 avenue Agirond',
    zip_code: 26400,
    city: 'Crest',
    country: 'France',
    activity_code: 95,
    creation_date: '01/03/2007'.to_date
  )
  customer.save!
  quote = Quote.new(
    seuil: 750,
    guarantie: 6500,
    guarantie_a: 34000,
    guarantie_b: 17000,
    consultation_number: 125,
    prime: 17186,
    prime_a: 595,
    prime_b: 397,
    reconstitution_1: 17845,
    reconstitution_2: 18514,
    reconstitution_3: 19188,
    g_a_up: 44000,
    g_a_down: 24000,
    prime_up: 21098,
    r_1_up: 21951,
    r_2_up: 22620,
    r_3_up: 232294,
    prime_down: 13080,
    r_1_down: 13739,
    r_2_down: 14408,
    r_3_down: 15082,
    user_id: user_2.id,
    customer_id: customer.id
  )
  quote.save!
  quote = Quote.new(
    seuil: 750,
    guarantie: 6500,
    guarantie_a: 34000,
    guarantie_b: 17000,
    consultation_number: 125,
    prime: 17186,
    prime_a: 595,
    prime_b: 397,
    reconstitution_1: 17845,
    reconstitution_2: 18514,
    reconstitution_3: 19188,
    g_a_up: 44000,
    g_a_down: 24000,
    prime_up: 21098,
    r_1_up: 21951,
    r_2_up: 22620,
    r_3_up: 232294,
    prime_down: 13080,
    r_1_down: 13739,
    r_2_down: 14408,
    r_3_down: 15082,
    user_id: user_2.id,
    customer_id: customer.id
  )
  quote.save!

  User.seed(user_2.id)
  User.seed(user_3.id)

puts 'creating consumer'
  consumer_1 = Consumer.create(
    siret: '342248499',
    name: 'Rozenbal France',
    country: 'France',
    address: '297 rue du Petit Mas ZI de Courtine',
    zip_code: '84000',
    city: 'Avignon',
    customer_id: 1,
    risk_allowed: false,
    grade: 'e')

  consumer_2 = Consumer.create(
    siret: '433428018',
    name: 'Advens',
    country: 'France',
    address: '32 rue Faidherbe',
    zip_code: '59800',
    city: 'Lille',
    customer_id: 1,
    risk_allowed: false,
    grade: 'e')

  consumer_3 = Consumer.create(
    siret: '659501837',
    name: 'Société Nouvelle Librairie Charlemagne',
    country: 'France',
    address: '50 bd de Strasbourg',
    zip_code: '83000',
    city: 'Toulon',
    customer_id: 1,
    risk_allowed: false,
    grade: 'd')

  consumer_4 = Consumer.create(
    siret: '318745106',
    name: 'Demarez Sa',
    country: 'France',
    address: '249 rue Irene Jolot Curie',
    zip_code: '60160',
    city: 'La Croix Saint Ouen',
    customer_id: 1,
    risk_allowed: false,
    grade: 'd')

  consumer_5 = Consumer.create(
    siret: '329382600',
    name: 'Picoty Aquitaine',
    country: 'France',
    address: '44 rue du 503ième Rgt du Train',
    zip_code: '33127',
    city: 'Martignas sur Jamme',
    customer_id: 1,
    risk_allowed: true,
    grade: 'b')

  consumer_6 = Consumer.create(
    siret: '679200287',
    name: 'Armor Protéines',
    country: 'France',
    address: '2 Route Neuve',
    zip_code: '50420',
    city: 'Conde sur Vire',
    customer_id: 1,
    risk_allowed: true,
    grade: 'b')

  consumer_7 = Consumer.create(
    siret: '732075312',
    name: 'Accenture',
    country: 'France',
    address: '118 avenue de France',
    zip_code: '75013',
    city: 'Paris',
    customer_id: 1,
    risk_allowed: true,
    grade: 'a')

  consumer_8 = Consumer.create(
    siret: '847120185',
    name: 'Bongrain Sa',
    country: 'France',
    address: '42 rue Rieussec',
    zip_code: '78220',
    city: 'Viroflay',
    customer_id: 1,
    risk_allowed: true,
    grade: 'a')


puts 'Finished!'
