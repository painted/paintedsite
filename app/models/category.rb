class Category < ActiveRecord::Base
	has_attached_file :image,
	styles: { thumb: '300X300>', large: '600X600>', small: '150X150>', vsmall: '100X100>' },
	storage: :s3, 
	s3_credentials: {
			bucket: 'PaintedLtd',
			access_key_id: Rails.application.secrets.s3_access_key,
			secret_access_key: Rails.application.secrets.s3_secret_access_key
	}
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates_attachment :image, :presence => true
	has_and_belongs_to_many :tags

	def tag_names
	end

	def tag_names=(tag_list)
		tag_list.split(', ').each do |tag|
			tags << Tag.find_or_create_by(name: tag)
		end
	end
end
