class AddListingToFeatures < ActiveRecord::Migration
  def change
    add_reference :features, :listing, index: true, foreign_key: true
  end
end
