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
    user_1.save!
    user_2.save!
    user_3.save!
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

  User.seed(user_2.id)
  User.seed(user_3.id)

puts 'Finished!'
