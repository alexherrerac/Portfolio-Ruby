Rails.application.routes.draw do
  resources :portfolios
  
  get 'contact', to: 'pages#contact'
  get 'about', to: 'pages#about'

  resources :blogs
  
  root "pages#home"
end
