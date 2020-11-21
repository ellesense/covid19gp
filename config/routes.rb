Rails.application.routes.draw do
  get 'pages/contact'
  get 'pages/about'

  root 'pages#home'
end
