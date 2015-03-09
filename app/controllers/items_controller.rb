class ItemsController < ApplicationController
	before_action :signed_in_user, except: [:show]
	# testing needed for correct_user actions update and destroy
	before_action :correct_user, only: [:destroy, :edit, :update]
	before_action :admin_user, only: [:admin]

	#GET /items
	def index
		@items = current_user.items.paginate(page: params[:page])
	end

	#GET /coll
	def coll
		@items = current_user.items.where( is_a_box: true )
	end

	#GET /boxes
	def boxes
		@items = current_user.items.where( is_a_box: true )
	end

	#GET /things
	def things
		@items = current_user.items.where( is_a_box: false )
	end

	#GET /items/export
	def export
		@items = current_user.items
	end

	#GET /items/:id
	def show
		@item = Item.find(params[:id])
	end

	#GET /items/:id/throw_away
	def throwaway
		#@item = Item.find(params[:id])
	end

	#GET /items/help
	def help
	end

	#GET /items/new
	def new
		@item = Item.new
	end

	#GET /items/:id/add
	def add
		#if current_user.items.count >= current_user.max_items
		#	flash[:warning] = "You already have maximum number of items!"
		#end
		@parent = Item.find(params[:item_id])
		@new_item = Item.new(:parent_id => params[:item_id])
	end

	#POST /items
	def create
		@item = current_user.items.build(item_params)
		if @item.save
			flash[:success] = "Item added!"
			redirect_to @item
		else
			render 'new'
		end
  end

  #GET /items/:id/edit
	def edit
		@parents = current_user.items.where( is_a_box: true )
		@item = Item.find(params[:id])
	end

  #GET /items/:id/admin
	def admin
		#@item = Item.find(params[:id])
	end

	#GET /items/:id/move
	def move
		@item = Item.find(params[:item_id])
		@parents = current_user.items.where( is_a_box: true )
	end

	#PATCH/PUT /items/:id
	def update
		@item = Item.find(params[:id])
		@item.parent_id = params[:parent_id]
		if @item.update_attributes(item_params)
			flash[:success] = "Item updated"
			redirect_to @item
		else
			render 'edit'
		end
	end

	#DELETE /items/:id
	def destroy
	end

	private
		def item_params
			params.require(:item).permit(:name, :is_a_box, :parent_id)
		end

		def correct_user
			@items = current_user.items.find_by(id: params[:id])
			redirect_to root_url if @items.nil?
			#redirect_to root_url unless current_user?(@micropost.user)
		end

		def admin_user
			redirect_to(root_url) unless current_user.admin?
		end
end