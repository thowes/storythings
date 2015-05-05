class UsersController < ApplicationController
	before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :show, :admin, :following, :followers, :level]
	#before_action :signed_in_user, except: [:create]
	before_action :correct_user,   only: [:edit, :update]
	before_action :admin_user,     only: [:destroy, :admin]

	#GET /users/
	def index
		@users = User.paginate(page: params[:page])
	end

	#GET /users/:id/
	def show
		@user = User.find(params[:id])
		@microposts = @user.microposts.paginate(page: params[:page])
	end

	#GET /users/new/
	def new
		@user = User.new
	end

	#POST /users/new/
	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			@my_items = @user.items.build(name: "My Items", is_a_box: true)
			@my_items.save
			@household = @user.items.build(name: "My Household Stuff", is_a_box: true)
			@household.save
			@my_lib = @user.items.build(name: "My Library", is_a_box: true)
			@my_lib.save
			@my_digi = @user.items.build(name: "My Digital Library", is_a_box: true)
			@my_digi.save
			@user.digicoll = @my_digi.id #doesn't work
			flash[:success] = "Welcome to the Storythings!"
			redirect_to @user
		else
			render 'new'
		end
	end

	#GET /users/:id/edit
	def edit
		#@user = User.find(params[:id])
	end

	#GET /users/:id/admin
	def admin
		@user = User.find(params[:user_id])
	end

	#PATCH /users/:id/
	def update
		#@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			# Handle a successful update.
			flash[:success] = "Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
	end
	
	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User deleted."
		redirect_to users_url
	end
	
	def following
		@title = "Following"
		@user = User.find(params[:id])
		@users = @user.followed_users.paginate(page: params[:page])
		render 'show_follow'
	end

	def followers
		@title = "Followers"
		@user = User.find(params[:id])
		@users = @user.followers.paginate(page: params[:page])
		render 'show_follow'
	end

	#GET /level
	def level
		@user = current_user
		@counted_items = current_user.items.count
		#if level_complete(@user.level)
			#sho 
		#end
	end
	
	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_url) unless current_user?(@user)
		end

		def admin_user
			redirect_to(root_url) unless current_user.admin?
		end
end
