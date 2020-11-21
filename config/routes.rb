Rails.application.routes.draw do
  resources :entries
  devise_for :users
  get 'pages/contact'
  get 'pages/about'

  root 'pages#home'
end
