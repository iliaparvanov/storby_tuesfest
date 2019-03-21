Rails.application.routes.draw do
  get "/", to: "home#index"
  resources :home
  resources :reviews
  devise_for :users, controllers: { registrations: "users/registrations" }
  devise_for :views
  resources :games
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
