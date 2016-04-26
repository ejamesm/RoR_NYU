class User < ActiveRecord::Base
  has_secure_password

  has_many :listings

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password, length: {minimum: 8}, allow_nil: true
  validates :usertype, presence: true

  def to_s
  	"#{firstname} " + "#{lastname}"
  end

end
