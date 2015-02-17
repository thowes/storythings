class QuestsController < ApplicationController
  before_action :signed_in_user
  before_action :set_quest, only: [:show, :edit, :update, :destroy]
  #before_action :admin_user, only: [:new, :edit, :create, :update, :destroy]

  # GET /quests (.json)
  def index
    @quests = Quest.all
  end

  # GET /quests/export
  def export
    @quests = Quest.all
  end

  # GET /quests/1 (.json)
  def show
  end

  # GET /quests/new
  def new
    @quest = Quest.new
  end

  # GET /quests/1/edit
  def edit
  end

  # POST /quests (.json)
  def create
    @quest = Quest.new(quest_params)
    respond_to do |format|
      if @quest.save
        format.html { redirect_to @quest, notice: 'Quest was successfully created.' }
        format.json { render action: 'show', status: :created, location: @quest }
      else
        format.html { render action: 'new' }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quests/1 (.json)
  def update
    respond_to do |format|
      if @quest.update(quest_params)
        format.html { redirect_to @quest, notice: 'Quest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quests/1 (.json)
  def destroy
    @quest.destroy
    respond_to do |format|
      format.html { redirect_to quests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quest
      @quest = Quest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quest_params
      params.require(:quest).permit(:name, :qtype, :mother, :next_quest, :prev_quest)
    end
end
