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
    get '/parents', to: 'parents/announcements#index'
    get "sign_in", to: "devise/sessions#new"
    get "login", :to => "devise/sessions#new"
    delete "sign_out", :to => "devise/sessions#destroy"
    delete "logout", :to => "devise/sessions#destroy"
  end

  namespace :parents do
    root 'announcements#index'

    # resources :peeks, only: [:show, :index], controller: 'peek_and_vocabs'
    get 'curriculum/peek_and_vocab' => 'peek_and_vocabs#index'
    get '/curriculum/current/peek' => 'peek_and_vocabs#current_peek'
    get '/curriculum/current/vocab' => 'peek_and_vocabs#current_vocab'
    get '/curriculum/peek/:id' => 'peek_and_vocabs#show_peek'
    get '/curriculum/vocab/:id' => 'peek_and_vocabs#show_vocab'

    resources :newsletters, only: [:show, :index]
    get '/newsletter/current' => 'newsletters#current'

    resources :announcements, only: [:index]    
    resources :class_contact_lists, only: [:index, :show]
    resource :calendar, :registration_form, :handbook, only: [:show]
  end

  #  Admin Dashboard Paths
  namespace :admin do
    root 'peek_and_vocabs#index'
    get '/dashboard' => 'dashboard#home'

    resources :classes, controller: 'groups'
    resources :groups
    
    resources :parents, controller: "users"
    resources :users
    
    resources :peeks, controller: 'peek_and_vocabs'
    resources :peek_and_vocabs

    get '/file_uploader' => 'dashboard#file_uploader'
    resources :calendars, :handbooks, :registration_forms, except: [:destroy]
    resources :class_contact_lists, except: [:new, :create, :destroy]
    resources :newsletters
    resources :announcements
  end

# CUSTOM ROUTES FOR ADMIN FUNCTIONS
  get '/email_announcement/:id' => 'admin/announcements#email_announcement'
  get '/email_peek/:id' => 'admin/peek_and_vocabs#email_peek'
  get '/email_newsletter/:id' => 'admin/newsletters#email_newsletter'
  get 'expired_announcements' => 'admin/announcements#expired'
  get 'current_announcements' => 'admin/announcements#current'

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
