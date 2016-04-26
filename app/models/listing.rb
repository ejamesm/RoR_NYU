class Listing < ActiveRecord::Base
	validates :title, presence: true
	belongs_to :user
	has_many :features, dependent: :destroy
	has_many :pictures, dependent: :destroy
end
