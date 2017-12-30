Rails.application.routes.draw do
  root 'application#index'

  get 'posts/index', as: 'blog'

  resources :posts do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
