class StaticPagesController < ApplicationController
	before_action :admin_user, only: [:testing, :admin]
	
	def home
		if signed_in?
			@micropost  = current_user.microposts.build
			@feed_items = current_user.feed.paginate(page: params[:page])
			@items = current_user.items.where( is_a_box: true )
		end
	end

	def help
	end

	def contact
	end

	def about
	end

	def admin
	end

	def testing
	end

	private
		def admin_user
			redirect_to(root_url) unless current_user.admin?
		end
end