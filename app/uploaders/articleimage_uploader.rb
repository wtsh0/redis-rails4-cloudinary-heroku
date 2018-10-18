class ArticleimageUploader < CarrierWave::Uploader::Base

  # Choose what kind of storage to use for this uploader:
  if Rails.env.production?
    include Cloudinary::CarrierWave
  else
    include CarrierWave::RMagick
    storage :file
  end

   def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def article_id
    Article.id
  end
end
