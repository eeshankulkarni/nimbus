DaysIn2::Application.routes.draw do
    resources :comments, only: [:create, :destroy]
    resources :users
    resources :locations
    resources :ratings, only: :update
    resources :sessions, only: [:create, :new, :destroy]
    resources :scores, only: [:create, :destroy]
    resources :reviews, only: [:create, :search, :destroy, :update]
    root 'stat_pages#home'
    match '/reviewsearch', to: 'reviews#index', via: 'get'
    match '/signout',  to: 'sessions#destroy',    via: 'delete'
    match '/signin',   to: 'sessions#new',     via: 'get'
    match '/signup',  to: 'users#new',          via: 'get'
    match '/help',    to: 'stat_pages#help',    via: 'get'
    match '/contact', to: 'stat_pages#contact', via: 'get'
    match '/reviewshow',  to: 'reviews#review', via: 'get'
    match '/reviewfilter', to:'reviews#index', via: 'get'
    match '/reviewedit', to:'reviews#edit', via: 'get'

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
