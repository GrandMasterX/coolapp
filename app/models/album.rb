class Album < ActiveRecord::Base
  	attr_accessible :title,:genre,:image,:cover
  	mount_uploader :image, ImageUploader
end
