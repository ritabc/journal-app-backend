Rails.application.routes.draw do
  resources :journals
  post "/signup", to: "users#create"
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  post "/login", to: "users#login"
end