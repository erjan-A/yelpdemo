class Restaurant < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	searchkick

	has_many :reviews, dependent: :destroy

	validates :name, :address, :phone, :website, :image, presence: true
	validates :phone, format: { with: /\A\+\d \d{3} \d{3} \d{2} \d{2}\z/,
															message: "must be in the format +7 123 456 78 90" }
	validates :website, format: { with: /\Ahttps?:\/\/.*\z/,
															message: "must start with http:// or http://" }
end
