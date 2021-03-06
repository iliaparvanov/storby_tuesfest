Rails.application.routes.draw do
  devise_for :userrails
  get "/", to: "home#index"
  resources :home, :reviews
  devise_for :users, path: 'dev', controllers: { registrations: "users/registrations" }
  devise_for :views
  resources :games
  # patch "/games/:id/buy", to: "games#add_to_user"
  get "/dev/dashboard", to: "users/custom#dashboard"
  post "/api/log_download", to: "games#log_download"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
