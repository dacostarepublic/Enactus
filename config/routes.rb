Rails.application.routes.draw do



  get 'info/about_us', :as=>"about_us"

  get 'info/help', :as=>"help"

  get 'recycling/index', :as => "recycling"

  get 'games/index', :as => "games"

  # get 'shop/specials', :as => "specials"

  # get 'shop/index', :as => "shop"

  resources :shop, :only => [:index] do
    collection do 
      get :specials
      post :add_to_cart
      # resources :categories, :only => [:index]
    end
  end
  match 'shop/categories/:name' => "categories#show", :via => :get, :as => 'category'

  # get 'administration', :as => "admin", :to =>"administration#index"
  resources :administration, :as=>"admin", :only=>[:index] do
    collection do
      get :items
      get :carousel
      post :new_item
      resources :items,:only=>[:show, :update, :destroy]
    end
  end
  resources :item_types, :only=>[:update, :destroy, :create] do
    member do
      put :reset_sold
    end
  end

  resources :cart, :only=>[:index, :destroy, :update] 

  # get 'sessions/new'

  # get 'users/index'

  # get 'users/signin'

  # get 'users/show'



  # get 'users/settings'

  # get 'users/history'

  resources :users, :only=>[:index,:show,:create, :edit, :update] do
    collection do
      get :signin
    end
    member do
      get :settings
      get :history
      get :first_sign_in
      get :my_cart
    end

  end
  resources :sessions, :only=>[:create,:destroy]

  root 'home#index' 

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
