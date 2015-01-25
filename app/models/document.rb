class Document < ActiveRecord::Base
	has_many :words
	mount_uploader :file, FileUploader


	def self.paragraphs(doc)
    prgrfs = []
    doc.paragraphs.each do |p|
      prgrfs << p 
    end
    prgrfs
  end

  


end
