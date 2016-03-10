Rails.application.routes.draw do
  scope :api, defaults: { format: 'json' } do
    resources :orgs
    resources :settings
    resources :jobs
    resources :indices
    resources :prosesses
    resources :communications
    resources :realms
    resources :clients
    resources :milestones
    resources :stages
    resources :praxis
    resources :sessions
    resources :labels
    resources :users
    resources :roles

    namespace :v1 do
      resources :events
    end
  end

  get 'login', to: 'sessions#index', as: 'login'
  get 'sessions', to: 'sessions#create', as: 'logon'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get "/*path" => redirect("/?goto=%{path}")
  root to: 'home#index'
end
