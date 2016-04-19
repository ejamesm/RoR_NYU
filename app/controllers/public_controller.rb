class PublicController < ApplicationController
	layout "public"

  def index
  	@listings = Listing.all

  	@pictures = []
  	@listings.each do |listing|
  		listing.pictures.each do |pic|
  			@pictures.push pic
  		end
  	end
  end

  def details
  	@listing = Listing.find(params[:listing_id])
  end
  
end
