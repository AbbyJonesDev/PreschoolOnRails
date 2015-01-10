PreschoolOnRails::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

  get '/about_us' => 'static_pages#about_us'
  get '/schedule' => 'static_pages#schedule'
  get '/activities' => 'static_pages#activities'
  get '/photo_gallery' => 'static_pages#photo_gallery'
  get '/register' => 'static_pages#register'
  get '/calendar' => 'static_pages#calendar'
  get "/registration_form" => 'static_pages#reg_form'
  get "/handbook" => 'static_pages#handbook'

  resources :peeks, only: [:show, :index],  controller: "newsletters"
  get '/peek/current' => 'newsletters#current'

  # Don't allow users to register... Admin/teacher will do that 
  # for them. They just need to change their password
  devise_for :users, :skip => [:registrations]                                          
    as :user do
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
      patch 'users/:id' => 'devise/registrations#update', :as => 'user_registration'            
    end

  # this lets you add to devise's routes because
  # now it knows you'll be in the user scope 
  # so you can use the simplified routes
  # (since devise is built for multiple scopes)
  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
    get "login", :to => "devise/sessions#new"
    delete "sign_out", :to => "devise/sessions#destroy"
    delete "logout", :to => "devise/sessions#destroy"
    get 'users', :to => redirect('/peek/current'), :as => :user_root
  end

  #  Admin Dashboard Paths
  namespace :admin do
    root 'newsletters#index'
    get '/dashboard' => 'dashboard#home'
    resources :classes, controller: 'groups'
    resources :groups
    resources :parents, controller: "users"
    resources :users
    get '/file_uploader' => 'dashboard#file_uploader'
    resources :calendars
    resources :handbooks
    resources :registration_forms
    resources :peek, controller: 'newsletters'
    resources :newsletters
  end

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
