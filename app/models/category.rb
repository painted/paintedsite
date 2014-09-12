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
end
