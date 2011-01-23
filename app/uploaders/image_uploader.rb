# encoding: utf-8
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  version :seventwenty do
    process :resize_to_fill => [720,424]
  end

  version :sixfourty do
    process :resize_to_fill => [640,480]
  end

  version :twelveeighty do
    process :resize_to_fill => [1280,753]
  end

  version :fourfifty do
    process :resize_to_fill => [450,253]
  end

  version :threetwenty do
    process :resize_to_fill => [320,240]
  end

  version :thumb do
    process :resize_to_fill => [201,118]
  end

  version :mini_square do
    process :resize_to_fill => [32,32]
  end
  version :mini_thumb do
    process :resize_to_fill => [16,9]
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # def filename
  #   "something.jpg" if original_filename
  # end

end
