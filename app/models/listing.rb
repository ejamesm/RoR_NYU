class Listing < ActiveRecord::Base
	validates :title, presence: true
	has_many :features, dependent: :destroy
	has_many :pictures, dependent: :destroy
end
