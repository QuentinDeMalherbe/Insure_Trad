class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :contracts

  def full_name
    " afaire"
  end

  def self.seed(user_id)

    # 1 POPHIN
    customer = Customer.find 1

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
      user_id: user_id,
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
    customer = Customer.find 2

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
      user_id: user_id,
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
    customer = Customer.find 3

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
      user_id: user_id,
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
    customer = Customer.find 4

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
        user_id: user_id,
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
    customer = Customer.find 5

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
        user_id: user_id,
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
    customer = Customer.find 6

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
        user_id: user_id,
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
      customer = Customer.find 7

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
        user_id: user_id,
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
      customer = Customer.find 8

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
        user_id: user_id,
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
      customer = Customer.find 9

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
        user_id: user_id,
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
      customer = Customer.find 10

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
        user_id: user_id,
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
      customer = Customer.find 11

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
        user_id: user_id,
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
      customer = Customer.find 12

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
        user_id: user_id,
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
  end

end
