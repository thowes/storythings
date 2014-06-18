class ItemsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]

	def index
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(params[:item])    # Not the final implementation!
		if @Item.save
			# Handle a successful save.
		else
			render 'new'
		end
	end

	#def edit
	#end

	#def update
	#end

	def destroy
	end

end