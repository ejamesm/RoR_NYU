class Picture < ActiveRecord::Base
	validates :filename, presence: true
	belongs_to :listing
end
