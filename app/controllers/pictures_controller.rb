class PicturesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  	@listing = Listing.find(params[:listing_id])
  	@pictures = @listing.pictures
  end

  def new
    @user = User.find(params[:user_id])
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
      redirect_to controller: "pictures", action: "index"
    else
      render "new"
    end
  end

  def show
    @listing = Listing.find(params[:listing_id])
    @picture = @listing.pictures.find(params[:id])

  end

  def edit
    @user = User.find(params[:user_id])
  	@listing = Listing.find(params[:listing_id])
  	@picture = @listing.pictures.find(params[:id])
  end

  def update
    listingId = params[:listing_id]
    @listing = Listing.find(listingId)

    @picture = @listing.pictures.find(params[:id])
    uploadIO = params[:picture][:image]

    if uploadIO != nil
      if @picture.filename != nil
        filename = Rails.root.join("public", "images", @picture.filename)
        File.delete(filename) if File.exist?(filename)
      end
      t = Time.now
      ext = File.extname(uploadIO.original_filename)

      tmpFilename = "file_#{t.strftime("%Y%m%d%H%M")}" + ext

      @picture.filename = tmpFilename

      filename = Rails.root.join("public", "images", tmpFilename)

      File.open(filename, "wb") do |file|
        file.write(uploadIO.read)
      end

    end

    if @picture.update(picture_params)
      redirect_to controller: "pictures", action: "index"
    else
      render "edit"
    end 
      
  end

  def destroy
    listingId = params[:listing_id]
    listing = Listing.find(listingId)

    picture = listing.pictures.find(params[:id])

    if picture.filename != nil
      filename = Rails.root.join("public", "images", picture.filename)
      File.delete(filename) if File.exist?(filename)
    end

    listing.pictures.destroy(picture)
    redirect_to controller: "pictures", action: "index"
  end

  private

    def picture_params
      params.require(:picture).permit(:listing_id, :title)
    end

end
