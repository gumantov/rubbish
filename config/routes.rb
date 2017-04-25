Rails.application.routes.draw do
  root 'mails#index'
  resources :companies
  get "mails/about"
  resources :mails
  devise_for :users


  resources :products do
    get :autocomplete_company_name, :on => :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
