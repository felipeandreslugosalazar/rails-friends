Rails.application.routes.draw do
  devise_for :users
  resources :friends
  get "home/index"
  get "home/about"
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # felipe:
  # 2. devise installation
  # 2. Ensure you have defined root_url to *something* in your config/routes.rb.
  #  For example: root to: "home#index" Not required for API-only Applications *

end
