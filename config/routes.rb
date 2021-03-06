Rails.application.routes.draw do

  devise_scope :user do 
    root "users/registrations#new"
  end

  devise_for :users, :controllers => { :registrations => "users/registrations",
                                       :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'newsfeed' => 'users#newsfeed'
  get 'timeline/:id', to: 'users#timeline', as: :timeline
  get 'friends' => 'users#friends'
  get 'friend_requests' => 'users#friend_requests'
  get 'find_friends' => 'users#find_friends'
  get 'profile_friends/:id' => 'profile#friends', as: :profile_friends
  get 'search' => 'users#search'

  resources :friendships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :users, only: [:index, :show]
  resources :posts, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :notifications, only: [:index]
  resources :profile, only: [:show, :edit, :update]
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
