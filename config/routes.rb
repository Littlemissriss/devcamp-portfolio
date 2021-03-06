Rails.application.routes.draw do
  resources :topics, only: [:index, :show]

  #resources :comments #(replaced by mount, below)
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'portfolios/angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: "portfolios#show", as: 'portfolio_show'
  
  #get 'pages/home'
  #get 'pages/about'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'pages/test', to: 'pages#test'

  resources :blogs do
    member do
      get :toggle_status
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  root to: 'pages#home'
end
