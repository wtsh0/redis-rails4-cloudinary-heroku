class ArticleimageUploader < CarrierWave::Uploader::Base

  # Choose what kind of storage to use for this uploader:
  # if Rails.env.production?
    include Cloudinary::CarrierWave
  # else
  #   include CarrierWave::RMagick
  #   storage :file
  # end
  # process :tags => ['picture']
  # process :tags =>['picture']
  #  def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end
  version :standard do
    process :resize_to_fill => [400, 400, :center]
  end
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def public_id
    return "redis-rails4-cloudinary-heroku/" + Cloudinary::Utils.random_public_id
  end
end
