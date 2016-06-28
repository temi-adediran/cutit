Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :urls, only: [:edit, :create, :update, :destroy]

  root "urls#homepage"

  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  get "dashboard" => "urls#dashboard"
  get "details/:id" => "urls#details", as: :details
  get "/:short_url" => "urls#redirect_short_url", as: :short_url
end
