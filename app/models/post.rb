class Post < ApplicationRecord

	# FriendlyId Gem 的必備程式碼
  extend FriendlyId
  friendly_id :title, use: :slugged

  # 首頁 Post，按照 新 -> 舊
  scope :most_recent, -> { order(id: :desc) }

  # 上傳照片
  mount_uploader :image, PhotoUploader

	def should_generate_new_friendly_id?
		title_changed?
	end

end
