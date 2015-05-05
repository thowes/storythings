Storythings::Application.routes.draw do
	resources :admins
  resources :experiences
  resources :quests
	resources :users do
		get 'admin'
		get 'level'
		member do
			get :following, :followers
		end
	end

	resources :badges
  resources :licenses
	resources :sessions, only: [:new, :create, :destroy]
	resources :microposts, only: [:create, :destroy]
	resources :relationships, only: [:create, :destroy]

	resources :items do
		get 'add'
		get 'admin'
		get 'throwaway'
		collection do
			get 'coll'
			get 'components'
			get 'boxes'
			get 'export'
			get 'help'
			get 'summary'
			get 'things'
		end
	end
  
	root  'static_pages#home'
	match '/about',   to: 'static_pages#about',   via: 'get'
	match '/boxes',   to: 'items#boxes',          via: 'get'
	match '/coll',    to: 'items#coll',           via: 'get'
	match '/components', to: 'items#components',  via: 'get'
	match '/contact', to: 'static_pages#contact', via: 'get'
	match '/help',    to: 'static_pages#help',    via: 'get'
	match '/level',   to: 'users#level',          via: 'get'
	match '/signin',  to: 'sessions#new',         via: 'get'
	match '/signout', to: 'sessions#destroy',     via: 'delete'
	match '/signup',  to: 'users#new',            via: 'get'
	match '/summary', to: 'items#summary',        via: 'get'
	match '/testing', to: 'static_pages#testing', via: 'get'
	match '/things',  to: 'items#things',         via: 'get'

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
