Rails.application.routes.draw do
  devise_for :users
  get 'contact' => 'pages#contact'
  get 'about' => 'pages#about'

  resources :portfolios, except: [:show]
  get 'portfolio/:id' => 'portfolios#show', as: 'portfolio_show'

  namespace :admin do
    get 'dashboard/main'
    get 'dashboard/users'
    get 'dashboard/posts'
    get 'dashboard/:premier', to: 'dashboard#something'
    get 'dashboard/:premier/:deuxieme', to: 'dashboard#something'
  end

  resources :posts do
    member do
      get :toggle_status
    end
    resources :comments
  end


  get 'apps', to: 'application#index'

  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
