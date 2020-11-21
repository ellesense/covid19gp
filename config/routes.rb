Rails.application.routes.draw do
  resources :entries
  devise_for :users

  get 'pages/contact'
  get 'pages/about'
  
  get '/my_page', to: 'pages#my_page'

  get '/not_found', to: 'pages#not_found'

  root 'pages#home'

  get '*path' => redirect('/not_found')

end
