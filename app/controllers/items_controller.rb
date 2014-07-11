class ItemsController < ApplicationController
	before_action :signed_in_user, except: [:show]
	# testing needed for correct_user actions update and destroy
	before_action :correct_user, only: [:destroy, :edit, :update]

	#GET /items
	def index
		@items = current_user.items.paginate(page: params[:page])
	end

	#GET /boxes
	def boxes
		@items = current_user.items.where( is_a_box: true )
	end

	#GET /list
	def list
		@items = current_user.items.where( is_a_box: false )
	end

	#GET /things
	def things
		@items = current_user.items.where( is_a_box: false )
	end

	#GET /items/:id
	def show
		@item = Item.find(params[:id])
	end

	#GET /items/help
	def help
	end

	#GET /roots
	def roots
		@items = current_user.items.root?
	end

	#GET /coll
	def coll
		@items = current_user.items.where( parent_id: 1 )
	end

	#GET /components
	def components
		@items = current_user.items.where( depth: 4 )
	end

	#GET /add or /items/new
	def new
		@item = Item.new
	end

	#GET /newbox
	def newbox
		@item = Item.new
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
		@item = Item.find(params[:id])
	end

	#PATCH/PUT /items/:id
	def update
		@item = Item.find(params[:id])
		if @item.update_attributes(item_params)
			flash[:success] = "Item name updated"
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
end