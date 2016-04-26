class FeaturesController < ApplicationController
	  def index
	  	@user = User.find(params[:user_id])
	  	@listing = Listing.find(params[:listing_id])
	  	@features = @listing.features
	  end

	  def new
	  	@user = User.find(params[:user_id])
	  	@listing = Listing.find(params[:listing_id])
	  	@feature = Feature.new
	  end

	  def create
	  	@listing = Listing.find(params[:listing_id])
	  	@feature = Feature.new(feature_params)
	  	@feature.listing = @listing
    	if @feature.save
      	redirect_to controller: "features", action: "index"
    	else
      render "new"
    	end
	  end

	  def edit
	  	@user = User.find(params[:user_id])
	  	@listing = Listing.find(params[:listing_id])
	  	@feature = Feature.find(params[:id])
	  end

	  def update
	  	@listing = Listing.find(params[:listing_id])
	  	@feature = Feature.find(params[:id])
	  	if @feature.update(feature_params)
      	redirect_to controller: "features", action: "index"
    	else
      render "new"
    	end
	  end

	  def destroy
	  @listing = Listing.find(params[:listing_id])
	  @feature = Feature.find(params[:id])
	  	if @feature.destroy
	  		redirect_to controller: "features", action: "index"
	  	else
	  		redirect_to controller: "features", action: "index"
	  	end
		end

	private

		def feature_params
			params.require(:feature).permit(:user_id, :listing_id, :description)
		end

end
