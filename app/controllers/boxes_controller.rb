class BoxesController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  
	def index
	end

	def new
	end	
end
