Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'portfolio/angular', to: 'portfolios#angular', as: 'portfolio_angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
  get 'contact', to: 'pages#contact'
  get 'about', to: 'pages#about'

  resources :blogs do
    member do
      get :toggle_status
    end
  end
  
  root "pages#home"
end
