class Document < ActiveRecord::Base
	has_many :words
	mount_uploader :file, FileUploader
end
