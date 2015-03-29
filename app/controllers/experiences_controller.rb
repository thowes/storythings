class ExperiencesController < ApplicationController
  before_action :signed_in_user
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :destroy, :edit, :update]

  # GET /experiences(.format)
  def index
    @experiences = current_user.experiences
  end

  # GET /experiences/export
  def export
    @experiences = current_user.experiences
  end

  # GET /experiences/1(.format)
  def show
    #@quest = @experience.quest_id 
  end

  # GET /experiences/new
  def new
    @experience = Experience.new
  end

  # GET /experiences/1/edit
  def edit
  end

  # POST /experiences(.format)
  def create
    @experience = Experience.new(experience_params)
    respond_to do |format|
      if @experience.save
        format.html { redirect_to @experience, notice: 'Experience was successfully created.' }
        format.json { render action: 'show', status: :created, location: @experience }
      else
        format.html { render action: 'new' }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experiences/1(.format)
  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to @experience, notice: 'Experience was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiences/1(.format)
  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      params[:experience]
    end

    def correct_user
      @experiences = current_user.experiences.find_by(id: params[:id])
      redirect_to root_url if @experiences.nil?
      #redirect_to root_url unless current_user?(@micropost.user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
