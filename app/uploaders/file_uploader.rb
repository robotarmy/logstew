# encoding: utf-8

class FileUploader < CarrierWave::Uploader::Base

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

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
