class Property < ApplicationRecord

	# attr_accessor :visual
	
	belongs_to :person
	# belongs_to :cheese, optional: true

	# has_attached_file :image, styles: { large: "730 * 730>", medium: "350 * 350#" },  default_url: "/images/:style/missing.png"
	# validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	# has_one :cheese

	has_one_attached :visual
	has_many_attached :piece

	# mount_uploader :pict, PictUploader

	# mount_uploader :pic, PicUploader

	# mount_uploaders :pictures, PictureUploader
end
