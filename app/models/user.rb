class User < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  def image
    if self[:image].nil?
      DefaultImage.first.image
    else
      super
    end
  end
end
