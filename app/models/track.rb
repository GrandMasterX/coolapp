class Track < ActiveRecord::Base
	belongs_to :album
	mount_uploader :file, ImageUploader
	mount_uploader :cover, ImageUploader
  	attr_accessible :title,:genre,:file,:cover,:album_id
end
