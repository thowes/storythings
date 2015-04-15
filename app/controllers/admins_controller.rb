class AdminsController < ApplicationController
	before_action :signed_in_user
	before_action :admin_user

	#GET /admins/
	def index
		@admins = User.paginate(page: params[:page])
	end

	#GET /admins/:id/
	def show
		@admin = User.find(params[:id])
	end

	#GET /admins/:id/edit
	def edit
		@admin = User.find(params[:id])
	end

	#PATCH /admins/:id/
	def update
		@admin = User.find(params[:id])
		if @admin.update_attributes(admin_params)
			# Handle a successful update.
			flash[:success] = "Profile updated"
			redirect_to @admin
		else
			render 'edit'
		end
	end

	private
		def admin_params
			params.require(:admin).permit(:admin, :tester, :max_items, :components_allowed)
		end

		def admin_user
			redirect_to(root_url) unless current_user.admin?
		end

end
