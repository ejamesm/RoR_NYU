class Feature < ActiveRecord::Base
	validates :description, presence: true
	belongs_to :listing
end
