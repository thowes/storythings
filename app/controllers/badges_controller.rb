class BadgesController < ApplicationController
  before_action :set_badge, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  before_action :admin_user
  
  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def create
    @badge = Badge.new(badge_params)

    respond_to do |format|
      if @badge.save
        format.html { redirect_to @badge, notice: 'Badge was successfully created.' }
        format.json { render action: 'show', status: :created, location: @badge }
      else
        format.html { render action: 'new' }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @badge.update(badge_params)
        format.html { redirect_to @badge, notice: 'Badge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @badge.destroy
    respond_to do |format|
      format.html { redirect_to badges_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_badge
      @badge = Badge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def badge_params
      params.require(:badge).permit(:name, :picture)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
