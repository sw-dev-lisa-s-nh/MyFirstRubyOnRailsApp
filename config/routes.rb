# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get "/about", to: "about#index", as: :about

  get "/sign_up", to: "registrations#new", as: :new_sign_up

  get "/user/all", to: "users#get", as: :get_all_users

  post "/sign_up", to: "registrations#create", as: :sign_up

  get "/instrument", to: "instrument#new", as: :new_instrument
  
  post "/instrument", to: "instrument#create", as: :instrument

  get "/instrument/all", to: "instrument#get", as: :get_all_instruments

  get "/gig", to: "gig#new", as: :new_gig
  
  post "/gig", to: "gig#create", as: :gig

  get "/gig/all", to: "gig#get", as: :get_all_gigs

  # resources  :user, :instrument, :gig

  root to: "main#index"
end
