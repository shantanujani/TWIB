TWIB::Application.routes.draw do
  resources :units


  resources :users


  # Routes for the Game resource:
  # CREATE
  get '/games/new', controller: 'games', action: 'new', as: 'new_game'
  post '/games', controller: 'games', action: 'create'

  # READ
  get '/games', controller: 'games', action: 'index', as: 'games'
  get '/games/:id', controller: 'games', action: 'show', as: 'game'

  # UPDATE
  get '/games/:id/edit', controller: 'games', action: 'edit', as: 'edit_game'
  put '/games/:id', controller: 'games', action: 'update'

  # DELETE
  delete '/games/:id', controller: 'games', action: 'destroy'
  #------------------------------

  # Routes for the Team resource:
  # CREATE
  get '/teams/new', controller: 'teams', action: 'new', as: 'new_team'
  post '/teams', controller: 'teams', action: 'create'

  # READ
  get '/teams', controller: 'teams', action: 'index', as: 'teams'
  get '/teams/:id', controller: 'teams', action: 'show', as: 'team'

  # UPDATE
  get '/teams/:id/edit', controller: 'teams', action: 'edit', as: 'edit_team'
  put '/teams/:id', controller: 'teams', action: 'update'

  # DELETE
  delete '/teams/:id', controller: 'teams', action: 'destroy'
  #------------------------------

  # The priority is based upon order of creation:
  # first created -> highest priority.

 get '/users/new', controller: 'users', action: 'new', as: 'new_user'
  post '/users', controller: 'users', action: 'create'

  # READ
  get '/users', controller: 'users', action: 'index', as: 'users'
  get '/users/:id', controller: 'users', action: 'show', as: 'user'

  # UPDATE
  get '/users/:id/edit', controller: 'users', action: 'edit', as: 'edit_user'
  put '/users/:id', controller: 'users', action: 'update'

  # DELETE
  delete '/users/:id', controller: 'users', action: 'destroy'
  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
