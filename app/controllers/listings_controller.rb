class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :edit]

  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.paginate(:page => params[:page])
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = current_user.listings.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to @listing, notice: "Listing was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      @listing.amenity_list = params[:listing][:amenity]
      @listing.rule_list = params[:listing][:rule]
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = Listing.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def listing_params
    return params.require(:listing).permit(:name, :description, :property_type, :room_type, :capacity, :price, :min_stay, :address, :city_id, {photos: []})
  end
end
