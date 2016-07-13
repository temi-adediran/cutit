Rails.application.routes.draw do
  root 'urls#homepage'

  get 'signup' => 'users#new'

  scope controller: :sessions do
    get 'login'     => :new
    post 'login'    => :create
    delete 'logout' => :destroy
  end

  scope controller: :urls do
    get 'dashboard'     => :dashboard
    get 'details/:id'   => :details, as: :details
    get 'edit/:id'      => :edit, as: :edit_url
    get '/inactive'     => :inactive, as: :inactive
    get '/deleted'      => :deleted, as: :deleted
    get '/:short_url'   => :redirect_url, as: :short_url
  end

  resources :urls, only: [:create, :update, :destroy]
  resources :users, only: :create
end
