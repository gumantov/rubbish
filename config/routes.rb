Rails.application.routes.draw do
  root 'mails#index'
  resources :companies
  resources :mails
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
