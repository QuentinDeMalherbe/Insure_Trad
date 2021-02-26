# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_26_130424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_info_cinqs", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "zip_code"
    t.string "num_identification"
    t.string "terme_paiement"
    t.string "anciennete"
    t.string "regularite"
    t.string "experience"
    t.string "facture_impayee"
    t.bigint "police_cinq_million_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["police_cinq_million_id"], name: "index_client_info_cinqs_on_police_cinq_million_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "customer_id"
    t.integer "insure_trade_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_contracts_on_customer_id"
    t.index ["user_id"], name: "index_contracts_on_user_id"
  end

  create_table "customer_contacts", force: :cascade do |t|
    t.string "last_name_contact"
    t.string "last_name_dirigeant"
    t.string "last_name_correspondance"
    t.string "position_contact"
    t.string "position_dirigeant"
    t.string "position_correspondance"
    t.string "email_dirigeant"
    t.string "email_contact"
    t.string "email_correspondance"
    t.string "tel_contact"
    t.string "tel_dirigeant"
    t.string "tel_correspondance"
    t.bigint "insure_trad_supp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insure_trad_supp_id"], name: "index_customer_contacts_on_insure_trad_supp_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "compagny_name"
    t.string "address"
    t.integer "zip_code"
    t.string "city"
    t.string "country"
    t.integer "activity_code"
    t.string "siret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "creation_date"
  end

  create_table "customers_infos", force: :cascade do |t|
    t.string "legalForm"
    t.text "saleInsured"
    t.string "compagny_name"
    t.string "address"
    t.integer "zip_code"
    t.string "city"
    t.string "country"
    t.integer "activity_code"
    t.string "siret"
    t.bigint "insure_trad_supp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insure_trad_supp_id"], name: "index_customers_infos_on_insure_trad_supp_id"
  end

  create_table "gestions", force: :cascade do |t|
    t.integer "cgi"
    t.integer "logiciel"
    t.integer "document"
    t.integer "client_info"
    t.integer "client_solvabilite"
    t.integer "client_limit"
    t.integer "calcul_client_limit"
    t.integer "limit_time_payback"
    t.bigint "police_xol_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["police_xol_id"], name: "index_gestions_on_police_xol_id"
  end

  create_table "historic_losses_as", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "amount_loss"
    t.integer "number_client"
    t.integer "max_loss"
    t.bigint "police_xol_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["police_xol_id"], name: "index_historic_losses_as_on_police_xol_id"
  end

  create_table "historic_losses_bs", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "amount_loss"
    t.integer "number_client"
    t.integer "max_loss"
    t.bigint "police_xol_b_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["police_xol_b_id"], name: "index_historic_losses_bs_on_police_xol_b_id"
  end

  create_table "insure_trad_supps", force: :cascade do |t|
    t.integer "amountCA"
    t.float "percentCA"
    t.integer "numberTotalInsured"
    t.float "percentBadlyCovert"
    t.bigint "contract_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_insure_trad_supps_on_contract_id"
  end

  create_table "loss_payees", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "zipcode"
    t.string "city"
    t.string "country"
    t.bigint "primary_insurance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["primary_insurance_id"], name: "index_loss_payees_on_primary_insurance_id"
  end

  create_table "main_customer_as", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "zip_code"
    t.string "city"
    t.string "country"
    t.string "siret"
    t.integer "percent_ca"
    t.bigint "police_xol_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["police_xol_id"], name: "index_main_customer_as_on_police_xol_id"
  end

  create_table "main_customer_bs", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "zip_code"
    t.string "city"
    t.string "country"
    t.string "siret"
    t.integer "percent_ca"
    t.bigint "police_xol_b_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["police_xol_b_id"], name: "index_main_customer_bs_on_police_xol_b_id"
  end

  create_table "nbi_cinq_multiples", force: :cascade do |t|
    t.bigint "police_cinq_million_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["police_cinq_million_id"], name: "index_nbi_cinq_multiples_on_police_cinq_million_id"
  end

  create_table "nbi_cinq_uns", force: :cascade do |t|
    t.bigint "police_cinq_million_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "client_name"
    t.string "grade"
    t.string "montant_perte_base"
    t.string "quotite_base"
    t.string "duree_base"
    t.string "montant_perte_complementaire"
    t.string "montant_forfait_base"
    t.string "montant_forfait_complemmentaire"
    t.index ["police_cinq_million_id"], name: "index_nbi_cinq_uns_on_police_cinq_million_id"
  end

  create_table "nbis", force: :cascade do |t|
    t.integer "montant_min"
    t.integer "garantie_1_6_z_1"
    t.integer "garantie_1_6_z_2"
    t.integer "garantie_1_6_z_3"
    t.integer "garantie_7_z_1"
    t.integer "garantie_7_z_2"
    t.integer "garantie_7_z_3"
    t.integer "plafond_annuel_garantie_z_1"
    t.integer "plafond_annuel_garantie_z_2"
    t.integer "plafond_annuel_garantie_z_3"
    t.integer "nbr_client_risque_z_1"
    t.integer "nbr_client_risque_z_2"
    t.integer "nbr_client_risque_z_3"
    t.integer "prime_annuelle_1"
    t.integer "cout_police_1"
    t.integer "plafond_annuelle_option"
    t.integer "cumul_annuel_3"
    t.integer "cumul_annuel_2"
    t.integer "cumul_annuel_1"
    t.integer "franchise_cumulee"
    t.integer "garantie_auto"
    t.integer "prime_annuelle_option"
    t.integer "cout_police_option"
    t.bigint "police_xol_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["police_xol_id"], name: "index_nbis_on_police_xol_id"
  end

  create_table "options", force: :cascade do |t|
    t.integer "cumul_loses_insured"
    t.integer "max_auto_indiv_insured_loss"
    t.integer "annual_prenium"
    t.integer "quatrieme_layer"
    t.integer "troisieme_layer"
    t.integer "deuxieme_layer"
    t.integer "premier_layer"
    t.integer "policy_admin"
    t.bigint "insure_trad_supp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "optiontype"
    t.index ["insure_trad_supp_id"], name: "index_options_on_insure_trad_supp_id"
  end

  create_table "police_cinq_millions", force: :cascade do |t|
    t.bigint "contract_id", null: false
    t.integer "ammount_ca"
    t.integer "client_number"
    t.integer "max_loss"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "client_name"
    t.index ["contract_id"], name: "index_police_cinq_millions_on_contract_id"
  end

  create_table "police_xol_bs", force: :cascade do |t|
    t.integer "amount_ca_export_b"
    t.integer "amount_ca_export_c"
    t.integer "client_number"
    t.integer "delai_max"
    t.integer "dso"
    t.bigint "police_xol_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["police_xol_id"], name: "index_police_xol_bs_on_police_xol_id"
  end

  create_table "police_xols", force: :cascade do |t|
    t.integer "amount_ca_nat"
    t.integer "amount_ca_nat_else"
    t.integer "amount_ca_export_a"
    t.integer "client_number"
    t.integer "delai_max"
    t.integer "dso"
    t.bigint "contract_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contract_id"], name: "index_police_xols_on_contract_id"
  end

  create_table "primary_contacts", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "position"
    t.string "email"
    t.string "tel"
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_primary_contacts_on_customer_id"
  end

  create_table "primary_insurances", force: :cascade do |t|
    t.string "name_insurer"
    t.integer "policy_number"
    t.date "policy_period_start"
    t.date "policy_period_end"
    t.string "intermediaire"
    t.integer "loss_payee"
    t.bigint "insure_trad_supp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insure_trad_supp_id"], name: "index_primary_insurances_on_insure_trad_supp_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "client_info_cinqs", "police_cinq_millions"
  add_foreign_key "contracts", "customers"
  add_foreign_key "contracts", "users"
  add_foreign_key "customer_contacts", "insure_trad_supps"
  add_foreign_key "customers_infos", "insure_trad_supps"
  add_foreign_key "gestions", "police_xols"
  add_foreign_key "historic_losses_as", "police_xols"
  add_foreign_key "historic_losses_bs", "police_xol_bs"
  add_foreign_key "insure_trad_supps", "contracts"
  add_foreign_key "loss_payees", "primary_insurances"
  add_foreign_key "main_customer_as", "police_xols"
  add_foreign_key "main_customer_bs", "police_xol_bs"
  add_foreign_key "nbi_cinq_multiples", "police_cinq_millions"
  add_foreign_key "nbi_cinq_uns", "police_cinq_millions"
  add_foreign_key "nbis", "police_xols"
  add_foreign_key "options", "insure_trad_supps"
  add_foreign_key "police_cinq_millions", "contracts"
  add_foreign_key "police_xol_bs", "police_xols"
  add_foreign_key "police_xols", "contracts"
  add_foreign_key "primary_contacts", "customers"
  add_foreign_key "primary_insurances", "insure_trad_supps"
end
