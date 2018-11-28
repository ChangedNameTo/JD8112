class ExpoMapUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}"
  end
end