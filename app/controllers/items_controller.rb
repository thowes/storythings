class ItemsController < ApplicationController
	before_action :signed_in_user

	def index
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new
	end

	def create
		@item = current_user.items.build(item_params)
		if @item.save
			flash[:success] = "Item created!"
		end
	end

	#def edit
	#end

	#def update
	#end

	def destroy
	end

	private
		def item_params
			params.require(:item).permit(:item)
		end
end