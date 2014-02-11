class Track < ActiveRecord::Base
	attr_accessible :title,:genre,:cover,:file,:album_id
	belongs_to :album
	mount_uploader :file, ImageUploader
	mount_uploader :cover, ImageUploader
end
