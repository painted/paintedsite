class Category < ActiveRecord::Base
	has_attached_file :image, styles: { thumb: '300X300>' }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates_attachment :image, :presence => true
end
