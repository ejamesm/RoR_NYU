class PicturesController < ApplicationController
  def index
  	@listing = Listing.find(params[:listing_id])
  	@pictures = @listing.pictures
  end

  def new
  	@listing = Listing.find(params[:listing_id])
  	@picture = Picture.new
  end

  def create
    listingId = params[:listing_id]
    @listing = Listing.find(listingId)

    @picture = Picture.new(picture_params)

    @picture.listing = @listing

    uploadIO = params[:picture][:image]
    if uploadIO != nil
      t = Time.now
      ext = File.extname(uploadIO.original_filename)
      tmpFilename = "file_#{t.strftime("%Y%m%d%H%M")}" + ext
      @picture.filename = tmpFilename
      filename = Rails.root.join("public", "images", tmpFilename)
      File.open(filename, "wb") do |file|
        file.write(uploadIO.read)
      end
    end

    if @picture.save
      redirect_to listing_pictures_path
    else
      render "new"
    end
  end

  def edit
  	@listing = Listing.find(params[:listing_id])
  	@picture = @listing.pictures.find(params[:id])
  end

  private

    def picture_params
      params.require(:picture).permit(:listing_id, :title)
    end

end
