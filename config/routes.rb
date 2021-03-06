Rails.application.routes.draw do
  get 'prepare_order/index'

  resources :comments
  get 'search/index'

  get 'specific_report/index'

  get 'voucher/index'

  get 'report/index'

  resources :settings
  resources :clients
  #get 'users/index'
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/new',     to: 'users#new',       via: 'get', :as => "new_user"
  match '/users/:id',     to: 'users#show',       via: 'get', :as => "user"
  match '/users/:id/edit',     to: 'users#edit',       via: 'get'
  match '/users/:id/destroy',     to: 'users#destroy',       via: 'get'

  resources :orders
  #get '/orders/cancel' => "orders#cancel"
  get '/orders/:id/cancel', to: 'orders#cancel', :as => "cancel_order"
  get 'home/index'
 
  root 'home#index'
  #devise_for :users
  #devise_for :users, controllers: {
   #     sessions: 'users/sessions'
    #  }
      
  #resources :users
  
  devise_for :users, :path_prefix => 'colven', :controllers => { :passwords => 'users/edit', :registrations => 'users/registrations' }
  #devise_for :users
  #resources :users, :only =>[:show]
  resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
