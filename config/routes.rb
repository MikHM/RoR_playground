Rails.application.routes.draw do
  get 'pages/home'
  get 'contact' => 'pages#contact'
  get 'about' => 'pages#about'

  get 'posts/index', as: 'blog'

  resources :portfolios
  resources :posts do
    resources :comments
  end

  get 'apps', to: 'application#index'

  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
