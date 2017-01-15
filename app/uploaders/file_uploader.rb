# encoding: utf-8

class FileUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :large, if: :image? do
    process resize_to_fit: [1800, 1800]
  end

  version :medium, if: :image? do
    process resize_to_fit: [900, 900]
  end

  version :thumb, if: :image? do
    process resize_to_fill: [250, 250]
  end
  protected

  def image?(new_file)
    new_file.content_type.start_with? 'image'
  end
end
