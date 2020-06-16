Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'about', to: 'about#index'
  get 'about/my-share', to: 'about#my_share', as: 'my_share'
  get 'about/other-share-with-me', to: 'about#other_share_with_me', as: 'other_share_with_me'
  resources :profiles
  resources :locations
  root to: 'about#index'
end
