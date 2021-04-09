# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get "/about", to: "about#index", as: :about

  get "/sign_up", to: "registrations#new", as: :new_sign_up

  get "/user/all", to: "users#get", as: :get_all_users

  post "/sign_up", to: "registrations#create", as: :sign_up

  get "/instrument", to: "registration_instrument#new", as: :new_instrument
  
  post "/instrument", to: "registration_instrument#create", as: :instrument

  get "/instrument/all", to: "instrument#get", as: :get_all_instruments

  get "/gig", to: "registration_gig#new", as: :new_gig
  
  post "/gig", to: "registration_gig#create", as: :gig

  get "/gig/delete", to: "gig#deleteindex", as: :new_delete_gig

  post "/gig/delete", to: "gig#delete", as: :delete_gig

  get "/user/delete", to: "users#deleteindex", as: :new_delete_user

  post "/user/delete", to: "users#delete", as: :delete_user

  get "/gig/update", to: "gig#new", as: :new_update_gig
  
  post "/gig/update", to: "gig#update", as: :update_gig

  get "/gig/by", to: "gig#getby", as: :get_by_gigs
  
  get "/gig/all", to: "gig#get", as: :get_all_gigs

  get "/gig/all/available", to: "gig#getavailable", as: :get_all_available_gigs


  #resources  :user do
  #  resources :instrument
  #end

 # resources  :gig do
 #   resources :instrument
 # end

  root to: "main#index"
end
