Rails.application.routes.draw do
  root 'mails#index'
  resources :companies
  resources :mails
  #static pages routes
  get "/about" => 'statics#about'
  get "/contact" => 'statics#contact'

  #devise conf
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
