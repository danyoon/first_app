FirstApp::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" } do

    # Aliased routes to match Rails Tutorial
    get 'signin',  to: 'devise/sessions#new'
    get 'signout', to: 'devise/sessions#destroy'
    get 'signup',  to: 'devise/registrations#new'
  end
  
  resources :authentications
  resources :hotels do
    member {get :connecters}
    collection {post :import }  
  end

  resources :users do
    member {get :following, :followers}
    member {get :connecting}
  end

  resources :prices do
    member {get :historical}
  end

  # Additional user actions separated out into a new controller,
  # ProfilesController, due to conflicts with /users/:id route and
  # Devise's standard routes
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :prices, only: [:create, :destroy]
  resources :connections, only: [:create, :destroy]
  
  match '/statichotels',  to: 'static_pages#statichotels'
  match '/staticblurb',   to: 'static_pages#staticblurb'
  match '/staticcontact', to: 'static_pages#staticcontact'
  match '/stanford', to: 'static_pages#stanford'
  match '/sf', to: 'static_pages#sf'
  match '/lv', to: 'static_pages#lv'
  match '/nyc', to: 'static_pages#nyc'
  match '/hst', to: 'static_pages#hst'
  match '/drh', to: 'static_pages#drh'
  match '/sho', to: 'static_pages#sho'
  match '/lho', to: 'static_pages#lho'
  match '/bee', to: 'static_pages#bee'  
  match '/peb', to: 'static_pages#peb'
  match '/chsp', to: 'static_pages#chsp'
  match '/aht', to: 'static_pages#aht'
  match '/rlj', to: 'static_pages#rlj'
  match '/mgm', to: 'static_pages#mgm'
  match '/lvs', to: 'static_pages#lvs'
  match '/wynn', to: 'static_pages#wynn'
  match '/czr', to: 'static_pages#czr'
  
  root to: 'static_pages#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

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
