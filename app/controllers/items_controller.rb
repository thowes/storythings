class ItemsController < ApplicationController
	before_action :signed_in_user, except: [:show]

	#GET /items
	def index
		@items = current_user.items.paginate(page: params[:page])
	end

	#GET /boxes
	def boxes
		@items = current_user.items.where( is_a_box: true )
	end

	#GET /items/:id
	def show
		@item = Item.find(params[:id])
	end

	#GET /add or /items/new
	def new
		@item = Item.new
		#@item.is_a_box = false
	end

	#GET /newbox
	def newbox
		@item = Item.new
		#@item.is_a_box = true
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
			params.require(:item).permit(:name)
		end
end