# encoding: utf-8
require 'carrierwave/processing/mime_types'

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  permissions 0777
  include CarrierWave::RMagick
  include CarrierWave::MimeTypes
  process :set_content_type
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end
  ActionController::Base.helpers.asset_path("pig.png")
  def default_url
    '/images/pig.png'
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png mp3 wav wma ogg pdf doc docx xls xlsx audio mpeg 3ga 3gp 3g2 3gpp 3gp2 m4a m4b m4p m4v m4r mp4 aac flac flv avi asf wma wmv dpx mkv mka mks bwf mpg mpeg mp1 mp2 mp3 
      m1v m1a m2a mpa mpv rm mov ogm ogg ogv oga ogx nut riff webm weba wav mxf asx ts aiff aif aifc au snd caf)
  end

  #uploaders/image_uploader.rb
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
