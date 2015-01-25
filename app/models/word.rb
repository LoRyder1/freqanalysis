class Word < ActiveRecord::Base
	belongs_to :document

	def self.delete_suffix(document_parsed)
  	no_suffix = []
  	document_parsed.each do |word|
  		no_suffix << word.gsub(/\W|ed|ing/, "")
  	end
  	no_suffix
  end

  def self.delete_s(no_suffix)
  	no_s = []
  	no_suffix.each do |x|
    	if x == "is" || x == "was" 
    	  no_s << x
    	elsif x.chars.last == "s" 
    	  no_s << x.chomp("s")
    	else
    	  no_s << x 
    	end
  	end
    no_s
  end

  
end
