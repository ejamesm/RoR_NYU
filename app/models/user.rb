class User < ActiveRecord::Base
	validates :firstname, presence: true
	validates :email, presence: true
	validates :password, presence: true

end
