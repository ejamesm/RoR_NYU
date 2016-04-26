class ListingsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  	@listings = @user.listings
  end

  def new
    @user = User.find(params[:user_id])
    @listing = Listing.new
  end

  def create
    @user = User.find(params[:user_id])
    @listing = Listing.new(listing_params)
    @listing.user = @user
    if @listing.save
      redirect_to controller: "listings", action: "index"
    else
      redirect_to controller: "listings", action: "new"
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @listing = Listing.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to controller: "listings", action: "index"
    else
      render "new"
    end
  end

  def show
  end

  def destroy
    @user = User.find(params[:user_id])
    @listing = Listing.find(params[:id])
    if @listing.destroy
      redirect_to controller: "listings", action: "index"
    else
        redirect_to controller: "listings", action: "index"
    end
  end

  private

    def listing_params
      params.require(:listing).permit(:user_id, :title, :description, :price, :id)
    end

end
