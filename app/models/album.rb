class Album < ActiveRecord::Base
	has_many :track
  	mount_uploader :image, ImageUploader
  	attr_accessible :title,:genre,:image,:cover
end
