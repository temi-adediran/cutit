Rails.application.routes.draw do
  get 'sessions/new'
  resources :users
  resources :urls 

  root "urls#index"

  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create" 
  delete "logout" => "sessions#destroy"
  get "dashboard" => "urls#new"
  get "/:short_url" => "urls#redirect_short_url", as: :short_url
  
end
