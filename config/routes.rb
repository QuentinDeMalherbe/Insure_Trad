Rails.application.routes.draw do

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'pages#home'
    devise_for :users
    get '/pages/intermediaire', to: 'pages#intermediaire'
    get '/pages/assure', to: 'pages#assure'
    get '/profiles/insured_home', to: 'profiles#insured_home'
    get '/profiles/intermediaire_home', to: 'profiles#intermediaire_home'
    resources :quotes do
      collection do
        get :comparaison
        get :difference
        get :extension
        get :final_1
        get :final_2
      end
      member do
        get :devis
        get :signature
        get :pdf
      end
    end
    resources :customers, shallow: true, only:[:index, :new, :create, :show, :edit, :update] do
      resources :primary_contacts, shallow:true, only:[:new, :create, :edit, :update]
      resources :contracts, shallow: true,  only:[:new, :create] do
        resources :police_xols, shallow: true, only:[:new, :create, :show] do
          resources :police_xol_bs, only:[:new, :create, :edit, :update]
          resources :nbis, only:[:new, :create, :edit, :update, :show]
          resources :gestions, only:[:new, :create, :edit, :update]
        end
        resources :insure_trad_supps, shallow: true, only:[:new, :create, :show] do
          resources :options, only:[:new, :create, :edit, :update]
          resources :customer_contacts, only:[:new, :create, :edit, :update]
          resources :customers_infos, only:[:new, :create, :edit, :update]
          resources :primary_insurances, only:[:new, :create, :edit, :update] do
            resources :loss_payees, only:[:new, :create, :edit, :update]
          end
        end
        resources :police_cinq_millions, shallow: true, only:[:new, :create, :update, :show] do
          resources :nbi_cinq_uns, only:[:new, :create, :edit, :update, :show]
          resources :nbi_cinq_multiples, only:[:new, :create, :edit, :update, :show]
          resources :client_info_cinqs, only:[:new, :create, :edit, :update, :show]
          resources :customer_contacts, only:[:new, :create, :edit, :update]
        end
      end
    end
    resources :guarantee_ccs do
      collection do
        get :search
        get :result
        get :bought
      end
    end
    resources :guarantee_adds
    resources :unpaids
    resources :consumers
    resources :risks do
      collection do
        get :search
        get :result
      end
    end
    resources :sinisters
    get '/assures/:id/solde', to: 'assures#solde', as: 'solde_assure'

    get '/insure_trad_supps/:id/createpdf', to: 'insure_trad_supps#creationpdf', as: 'creation'
    get '/police_cinq_millions/:id/createpdf', to: 'police_cinq_millions#creationpdf', as: 'police_creation'
    get '/police_xols/:id/createpdf', to: 'police_xols#creationpdf', as: 'creation_police'
    get 'police_xols/:id/montant_important', to: 'police_xols#montant_important', as: 'montant_important'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
