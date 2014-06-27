class ItemsController < ApplicationController
	before_action :signed_in_user, except: [:show]

	def index
		@items = current_user.items.paginate(page: params[:page])
	end

	def boxes
		@items = current_user.items.where( is_a_box: true )
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new
		#@item.is_a_box = false
	end

	def newbox
		@item = Item.new
		#@item.is_a_box = true
	end

	def create
		@item = current_user.items.build(item_params)
		if @item.save
			flash[:success] = "Item added!"
			redirect_to @item
		else
			render 'new'
		end

  end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		if @item.save
			flash[:success] = "Item updated"
			redirect_to @item
		else
			render 'edit'
		end
	end

	def destroy
	end

	private
		def item_params
			params.require(:item).permit(:name)
		end
end