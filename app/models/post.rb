class Post < ApplicationRecord

	#ユーザーモデルとの多:1連携
	belongs_to :user

	#ユーザーモデルとの多:多連携
	has_many :favorites, dependent: :destroy

	#イメージアップローダー
	mount_uploader :image, ImageUploader

	#geocoder
	geocoded_by :address
	after_validation :geocode, if: :address_changed?

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	validates :address, presence: true

end
