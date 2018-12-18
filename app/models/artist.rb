class Artist < ActiveRecord::Base
    has_many :lyrics
    mount_uploader :image, PictureUploader
end
