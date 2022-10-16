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
    user_1.save!
    user_2.save!
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

  primary_contact = PrimaryContact.new(
    last_name: 'Pophin',
    first_name: 'Stéphanie',
    position: 'dirigeant',
    email: 'spophin@pophin.com',
    tel: '0135789500',
    customer_id: customer.id
  )
  primary_contact.save!

  contract = Contract.new(
    user_id: user_2.id,
    customer_id: customer.id,
    insure_trade_type: 0
  )
  contract.save!

  police_cinq_million = PoliceCinqMillion.new(
    contract_id: contract.id,
    ammount_ca: 100_000,
    client_number: 5,
    max_loss: 2000
  )
  police_cinq_million.save!


  puts 'Pophin finished'

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

  primary_contact = PrimaryContact.new(
    last_name: 'Martin',
    first_name: 'Bertrand',
    position: 'dirigeant',
    email: 'bertrand.martin@gmail.com',
    tel: '0538024560',
    customer_id: customer.id
  )
  primary_contact.save!

  contract = Contract.new(
    user_id: user_2.id,
    customer_id: customer.id,
    insure_trade_type: 0
  )
  contract.save!

  police_cinq_million = PoliceCinqMillion.new(
    contract_id: contract.id,
    ammount_ca: 250_000,
    client_number: 5,
    max_loss: 12000
  )
  police_cinq_million.save!

  puts 'Bruno Miarlon finished'

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

  primary_contact = PrimaryContact.new(
    last_name: 'Paul',
    first_name: 'Corinne',
    position: 'dirigeant',
    email: 'cpaul@emergenceagro.com',
    tel: '0241596832',
    customer_id: customer.id
  )
  primary_contact.save!

  contract = Contract.new(
    user_id: user_2.id,
    customer_id: customer.id,
    insure_trade_type: 0
  )
  contract.save!

  police_cinq_million = PoliceCinqMillion.new(
    contract_id: contract.id,
    ammount_ca: 500_000,
    client_number: 10,
    max_loss: 15000
  )
  police_cinq_million.save!

  puts 'Emergence Agro finished'


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

  primary_contact = PrimaryContact.new(
    last_name: 'Boudet',
    first_name: 'Hervé',
    position: 'dirigeant',
    email: 'Hboudet@gmail.com',
    tel: '0610506087',
    customer_id: customer.id
  )
  primary_contact.save!

  contract = Contract.new(
    user_id: user_2.id,
    customer_id: customer.id,
    insure_trade_type: 0
  )
  contract.save!

  police_cinq_million = PoliceCinqMillion.new(
    contract_id: contract.id,
    ammount_ca: 1_000_000,
    client_number: 10,
    max_loss: 20000
  )
  police_cinq_million.save!

  puts 'Sas Boudet finished'


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

  primary_contact = PrimaryContact.new(
    last_name: 'Thevenin',
    first_name: 'Laurent',
    position: 'dirigeant général',
    email: 'Laurentthevenin@gmail.com',
    tel: '0472856734',
    customer_id: customer.id
  )
  primary_contact.save!

  contract = Contract.new(
    user_id: user_2.id,
    customer_id: customer.id,
    insure_trade_type: 0
  )
  contract.save!

  police_cinq_million = PoliceCinqMillion.new(
    contract_id: contract.id,
    ammount_ca: 1_000_000,
    client_number: 20,
    max_loss: 15000
  )
  police_cinq_million.save!

  puts 'Thevenin finished'


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

  primary_contact = PrimaryContact.new(
    last_name: 'Zaer',
    first_name: 'Hicham',
    position: 'dirigeant',
    email: 'zaer@gmail.com',
    tel: '0578431256',
    customer_id: customer.id
  )
  primary_contact.save!

  contract = Contract.new(
    user_id: user_2.id,
    customer_id: customer.id,
    insure_trade_type: 0
  )
  contract.save!

  police_cinq_million = PoliceCinqMillion.new(
    contract_id: contract.id,
    ammount_ca: 1_500_000,
    client_number: 20,
    max_loss: 25000
  )
  police_cinq_million.save!

  puts 'Zaer finished'


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

  primary_contact = PrimaryContact.new(
    last_name: 'Collobert',
    first_name: 'Yannick',
    position: 'dirigeant général',
    email: 'yannickcollobert@revol.com',
    tel: '0139547891',
    customer_id: customer.id
  )
  primary_contact.save!

  contract = Contract.new(
    user_id: user_2.id,
    customer_id: customer.id,
    insure_trade_type: 0
  )
  contract.save!

  police_cinq_million = PoliceCinqMillion.new(
    contract_id: contract.id,
    ammount_ca: 1_500_000,
    client_number: 10,
    max_loss: 30000
  )
  police_cinq_million.save!

  puts 'Alain Revol finished'


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

  primary_contact = PrimaryContact.new(
    last_name: 'Chantelat',
    first_name: 'Jacky',
    position: 'pdg',
    email: 'jchantelat@gmail.com',
    tel: '0614359784',
    customer_id: customer.id
  )
  primary_contact.save!

  contract = Contract.new(
    user_id: user_2.id,
    customer_id: customer.id,
    insure_trade_type: 0
  )
  contract.save!

  police_cinq_million = PoliceCinqMillion.new(
    contract_id: contract.id,
    ammount_ca: 2_000_000,
    client_number: 20,
    max_loss: 25000
  )
  police_cinq_million.save!

  puts 'Chantelat finished'


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

  primary_contact = PrimaryContact.new(
    last_name: 'Martin',
    first_name: 'Jerome',
    position: 'directeur financier',
    email: 'jerome.martin@yahoo.com',
    tel: '0490567894',
    customer_id: customer.id
  )
  primary_contact.save!

  contract = Contract.new(
    user_id: user_2.id,
    customer_id: customer.id,
    insure_trade_type: 0
  )
  contract.save!

  police_cinq_million = PoliceCinqMillion.new(
    contract_id: contract.id,
    ammount_ca: 3_000_000,
    client_number: 40,
    max_loss: 35000
  )
  police_cinq_million.save!

  puts 'Gueydon finished'


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

  primary_contact = PrimaryContact.new(
    last_name: 'Damagnez',
    first_name: 'Thierry',
    position: 'directeur général',
    email: 'tdamagnez@ycufay.com',
    tel: '0589052311',
    customer_id: customer.id
  )
  primary_contact.save!

  contract = Contract.new(
    user_id: user_2.id,
    customer_id: customer.id,
    insure_trade_type: 0
  )
  contract.save!

  police_cinq_million = PoliceCinqMillion.new(
    contract_id: contract.id,
    ammount_ca: 3_000_000,
    client_number: 20,
    max_loss: 50000
  )
  police_cinq_million.save!

  puts 'Librairie Cufay finished'


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

  primary_contact = PrimaryContact.new(
    last_name: 'Guillemot',
    first_name: 'François',
    position: 'directeur général',
    email: 'fguillemot@ygmail.com',
    tel: '0678234512',
    customer_id: customer.id
  )
  primary_contact.save!

  contract = Contract.new(
    user_id: user_2.id,
    customer_id: customer.id,
    insure_trade_type: 0
  )
  contract.save!

  police_cinq_million = PoliceCinqMillion.new(
    contract_id: contract.id,
    ammount_ca: 4_000_000,
    client_number: 70,
    max_loss: 60000
  )
  police_cinq_million.save!

  puts 'Guillemot Olivier Informatique finished'


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

  primary_contact = PrimaryContact.new(
    last_name: 'Thuillier',
    first_name: 'Pierre',
    position: 'directeur financier',
    email: 'thuillier@chaudron.com',
    tel: '0285437790',
    customer_id: customer.id
  )
  primary_contact.save!

  contract = Contract.new(
    user_id: user_2.id,
    customer_id: customer.id,
    insure_trade_type: 0
  )
  contract.save!

  police_cinq_million = PoliceCinqMillion.new(
    contract_id: contract.id,
    ammount_ca: 5_000_000,
    client_number: 125,
    max_loss: 70000
  )
  police_cinq_million.save!

  puts 'Chaudron finished'


puts 'Finished!'
