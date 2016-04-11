class FeaturesController < ApplicationController
	  def index
	  	listingId = params[:listing_id]
	  	@listing = Listing.find(listingId)
	  	@features = @listing.features.all
	  end

	  def new
	  end

	  def create
	  end

	  def edit
	  end

	  def update
	  end

	  def destroy
	  end

	private

		def features_params
			params.require(:feature).permit(:listing_id, :description)
		end

end
