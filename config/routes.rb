Rails.application.routes.draw do

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'pages#home'
    devise_for :users
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
        end
      end
    end

    get '/insure_trad_supps/:id/createpdf', to: 'insure_trad_supps#creationpdf', as: 'creation'
    get '/police_xols/:id/createpdf', to: 'police_xols#creationpdf', as: 'creation_police'
    get 'police_xols/:id/montant_important', to: 'police_xols#montant_important', as: 'montant_important'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
