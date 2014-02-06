class Albums < ActiveRecord::Base
  	mount_uploader :image, ImageUploader
end
