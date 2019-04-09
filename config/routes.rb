Rails.application.routes.draw do
  devise_for :userrails
  get "/", to: "home#index"
  resources :home, :reviews
  devise_for :users, controllers: { registrations: "users/registrations" }
  devise_for :views
  resources :games
  put "/games/:id", to: "games#add_to_user"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
