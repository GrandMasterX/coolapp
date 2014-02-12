Myapp::Application.routes.draw do

  #devise_for :users
  #post 'auth/:provider/callback' => 'sessions#create'
  #post 'auth/failure' => redirect('/') 
  #post 'signout' => 'sessions#destroy', as: 'signout' 
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :main do
    resources :albums
  end
    root to: 'main#index'

    resources :albums
    resources :tracks

    post 'tracks/changealbum/:id' =>'tracks#changealbum'
    get "albums/index"
    get 'tracks/index'
    get "albums/show"
    get 'tracks/show'
    get "main/index"

    get 'albums/:id' => 'albums#show'
    get 'tracks/:id' => 'tracks#show'
    get 'tracksforalbums/:id' => 'tracksforalbums#show'

    get 'albums/new' => 'albums#new'
    get 'tracks/new' => 'tracks#new'

    get 'albums/edit/:id' => 'albums#edit'
    get 'tracks/edit/:id' => 'tracks#edit'
    
    get 'albums/delete/:id' => 'albums#destroy'
    get 'tracks/delete/:id' => 'tracks#destroy'

    post '/albums/create' => 'albums#create'
    post '/tracks/create' => 'tracks#create'
    post '/tracksforalbums/create' => 'tracksforalbums#create'

    post '/albums/new' => 'albums#new'
    post '/tracks/new' => 'tracks#new'

    post '/albums/edit' => 'albums#edit'
    post '/tracks/edit' => 'tracks#edit'

    resources :albums do
      resources :tracks
    end
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
