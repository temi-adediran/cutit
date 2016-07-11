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
  get "edit/:id" => "urls#edit", as: :edit
  get "/inactive" => "urls#inactive", as: :inactive
  get "/deleted" => "urls#deleted", as: :deleted
  get "/:short_url" => "urls#redirect_url", as: :short_url
end
