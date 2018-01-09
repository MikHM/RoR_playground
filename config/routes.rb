Rails.application.routes.draw do
  get 'contact' => 'pages#contact'
  get 'about' => 'pages#about'

  resources :portfolios, except: [:show]
  get 'portfolio/:id' => 'portfolio#show', as: 'portfolio_show'

  namespace :admin do
    get 'dashboard/main'
    get 'dashboard/users'
    get 'dashboard/posts'
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
