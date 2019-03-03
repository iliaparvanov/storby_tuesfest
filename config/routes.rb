Rails.application.routes.draw do
  devise_for :views
  resources :reviews
  devise_for :users
  resources :games
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
