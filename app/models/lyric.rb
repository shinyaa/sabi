class Lyric < ActiveRecord::Base
    #タイトルによる絞り込み
    scope :get_by_title, ->(title) {where("title like ?","%#{title}%")}
    belongs_to :artist
    mount_uploader :image, PictureUploader
end
