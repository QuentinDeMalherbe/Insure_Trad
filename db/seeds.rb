# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating  6 customers'
    customer_1 = Customer.new(
      compagny_name:'Alfatec Sistemas',
      address: 'address',
      zip_code: 46,
      city: 'city',
      country: 'Spain',
      activity_code: 62,
      siret: 'A46094556'
    )
    customer_1.save!
    customer_2 = Customer.new(
      compagny_name:'VELORCIOS SL',
      address: 'address',
      zip_code: 35,
      city: 'city',
      country: 'Spain',
      activity_code: 10,
      siret: 'B54093987'
    )
    customer_2.save!
    customer_3 = Customer.new(
      compagny_name:'METALURGIA GALAICA ',
      address: 'address',
      zip_code: 33,
      city: 'city',
      country: 'Spain',
      activity_code: 23,
      siret: 'A15008071'
    )
    customer_3.save!
    customer_4 = Customer.new(
      compagny_name:'Pophin',
      address: 'address',
      zip_code: 78,
      city: 'city',
      country: 'France',
      activity_code: 33,
      siret: '453798977'
    )
    customer_4.save!
    customer_5 = Customer.new(
      compagny_name:'Mialon et fils',
      address: 'address',
      zip_code: 17,
      city: 'city',
      country: 'France',
      activity_code: 39,
      siret: '337783695'
    )
    customer_5.save!
    customer_6 = Customer.new(
      compagny_name:'Emergence Agro',
      address: 'address',
      zip_code: 44,
      city: 'city',
      country: 'France',
      activity_code: 01,
      siret: '541186933'
    )
    customer_6.save!
    puts 'Finished!'
