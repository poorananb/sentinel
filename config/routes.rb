Rails.application.routes.draw do
  get 'client/index'

  get 'home' => 'home#index'
  get 'brand' => 'orgs#orgs'
  get 'jobs' => 'orgs#orgs'
  get 'clients' => 'clients#index'

  get 'orgs' => 'orgs#index'
  post 'orgs' => 'orgs#create'
  delete 'orgs' => 'orgs#destroy'
  put 'orgs' => 'orgs#update'
  
  get 'stages' => 'stages#index'
  post 'stages' => 'stages#create'
  delete 'stages' => 'stages#destroy'
  put 'stages' => 'stages#update'
  
  get 'clients' => 'clients#index'
  post 'clients' => 'clients#create'
  delete 'clients' => 'clients#destroy'
  put 'clients' => 'clients#update'
 
  get 'prosesses' => 'prosesses#index'
  post 'prosesses' => 'prosesses#create'
  delete 'prosesses' => 'prosesses#destroy'
  put 'prosesses' => 'prosesses#update'
  
  get 'communications' => 'communications#index'
  post 'communications' => 'communications#create'
  delete 'communications' => 'communications#destroy'
  put 'communications' => 'communications#update'
  
  get 'realms' => 'realms#index'
  post 'realms' => 'realms#create'
  delete 'realms' => 'realms#destroy'
  put 'realms' => 'realms#update'
  
  get 'praxis' => 'praxis#index'
  post 'praxis' => 'praxis#create'
  delete 'praxis' => 'praxis#destroy'
  put 'praxis' => 'praxis#update'
  get 'createPraxi' => 'praxis#new'
  
  get 'labels' => 'labels#index'
  post 'labels' => 'labels#create'
  delete 'labels' => 'labels#destroy'
  put 'labels' => 'labels#update'
  get 'createLabel' => 'labels#new'

  get 'signup', to: 'users#new', as: 'signup'
  get 'createUser', to: 'users#new', as: 'createuser'
  get 'login', to: 'sessions#index', as: 'login'
  get 'sessions', to: 'sessions#create', as: 'logon'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'users' => 'users#index'
  post 'users' => 'users#create'
  delete 'users' => 'users#destroy'
  put 'users' => 'users#update'
  
  get 'roles' => 'roles#index'
  post 'roles' => 'roles#create'
  delete 'roles' => 'roles#destroy'
  post 'roles/update'
  
  #get 'help'    => 'static_pages#help'
  #get 'about'   => 'static_pages#about'
  #get 'contact' => 'static_pages#contact'
  
  scope :api do
    resources :orgs, defaults: {format: 'json'}
  end
  
  scope :api do
      resources :prosesses, defaults: {format: 'json'}
  end
  
  scope :api do
      resources :communications, defaults: {format: 'json'}
  end
  
  scope :api do
      resources :realms, defaults: {format: 'json'}
  end
  
  scope :api do
      resources :clients, defaults: {format: 'json'}
  end
  scope :api do
      resources :stages, defaults: {format: 'json'}
  end
  scope :api do
      resources :praxis, defaults: {format: 'json'}
  end
  
  scope :api do
      resources :sessions, defaults: {format: 'json'}
  end

  scope :api do
    resources :labels, defaults: {format: 'json'}
  end

  scope :api do
      resources :users, defaults: {format: 'json'}
  end
  scope :api do
      resources :roles, defaults: {format: 'json'}
  end
  
  resources :users
  resources :orgs
  resources :sessions
  resources :prosesses
  resources :communications
  resources :realms
  resources :clients
  resources :stages
  resources :praxis
  resources :roles
  resources :labels
  resources :images
  
  namespace :api do
    namespace :v1 do
      resources :events, defaults: {format: 'json'}
    end
  end
  
  get 'events' => 'events#index'
  post 'events' => 'events#create'
  delete 'events' => 'events#destroy'
  put 'events' => 'events#update'
  
  namespace :admin do
  	get '', to: 'dashboard#index', as: '/'
  end

  resources :widgets
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root :to => 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
