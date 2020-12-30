Rails.application.routes.draw do
  resources :journals, except: [:update] do
    resources :notes, except: [:update]
  end


  post "/signup", to: "users#create"
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  post "/login", to: "users#login"
end