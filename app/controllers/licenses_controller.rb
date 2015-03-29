class LicensesController < ApplicationController
  before_action :set_license, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  before_action :admin_user

  # GET /licenses(.format)
  def index
    @licenses = License.all
  end

  # GET /licenses/1(.format)
  def show
  end

  # GET /licenses/new
  def new
    @license = License.new
  end

  # GET /licenses/1/edit
  def edit
  end

  # POST /licenses(.format)
  def create
    @license = License.new(license_params)

    respond_to do |format|
      if @license.save
        format.html { redirect_to @license, notice: 'License was successfully created.' }
        format.json { render action: 'show', status: :created, location: @license }
      else
        format.html { render action: 'new' }
        format.json { render json: @license.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /licenses/1(.format)
  def update
    respond_to do |format|
      if @license.update(license_params)
        format.html { redirect_to @license, notice: 'License was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @license.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /licenses/1(.format)
  def destroy
    @license.destroy
    respond_to do |format|
      format.html { redirect_to licenses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_license
      @license = License.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def license_params
      params.require(:license).permit(:name, :price)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
