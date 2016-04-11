class AddListingToPictures < ActiveRecord::Migration
  def change
    add_reference :pictures, :listing, index: true, foreign_key: true
  end
end
