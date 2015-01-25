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

  def self.combine(passages)
  	full_text = []
  	passages.each do |x|
  		full_text << x
  	end
  	full_text
  end

  def self.downcase_split(full_text)
  	full_text.join(" ").downcase.split(" ")
  end

  def self.count_words(no_s)
  	hash = Hash.new(0)
  	no_s.each do |value|
  		hash.store(value, hash[value]+1)
  	end
  	hash  	
  end

  def self.sorted_word_count(word_count)
  	sorted = word_count.sort_by {|key, value| value}
  	sorted.last(25).reverse
  end  
  
    
end
