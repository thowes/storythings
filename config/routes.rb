Storythings::Application.routes.draw do
	resources :users do
		member do
			get :following, :followers
		end
	end
	resources :sessions, only: [:new, :create, :destroy]
	resources :microposts, only: [:create, :destroy]
	resources :relationships, only: [:create, :destroy]
	resources :items do
		get 'newbox'
		collection do
			get 'boxes'
			get 'list'
		end
	end
  resources :badges
	root  'static_pages#home'
	match '/about',   to: 'static_pages#about',   via: 'get'
	match '/add',     to: 'items#new',            via: 'get'
	match '/boxes',   to: 'items#boxes',          via: 'get'
	match '/contact', to: 'static_pages#contact', via: 'get'
	match '/help',    to: 'static_pages#help',    via: 'get'
	match '/list',    to: 'items#list',           via: 'get'
	#match '/login',   to: 'sessions#new',         via: 'get'
	#match '/logout',  to: 'sessions#destroy',     via: 'delete'
	match '/newbox',  to: 'items#newbox',         via: 'get'
	match '/signin',  to: 'sessions#new',         via: 'get'
	match '/signout', to: 'sessions#destroy',     via: 'delete'
	match '/signup',  to: 'users#new',            via: 'get'

	# The priority is based upon order of creation: first created -> highest priority.
	# See how all your routes lay out with "rake routes".

	# Example of regular route:
	#   get 'products/:id' => 'catalog#view'

	# Example of named route that can be invoked with purchase_url(id: product.id)
	#   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

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
