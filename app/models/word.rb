class Word < ActiveRecord::Base
	belongs_to :document


  @@suffix_regex = /ed\z|ing\z|ly\z|er\z|or\z|ion\z|ible\z|able\z|al\z|ial\z|ness\z|ity\z|ty\z|ment\z|ic\z|ous\z|eous\z|ious\z|en\z|ive\z|ative\z|itive\z|ful\z|less\z|est\z/

  def self.delete_punctuation(document_parsed)
    no_punc = []
    document_parsed.each do |word|
      no_punc << word.gsub(/\W/, "")
    end
    no_punc
  end

	def self.delete_suffix(document_parsed)
  	no_suffix = []
  	document_parsed.each do |word|
      if word == "fact" || word == "for" || word == "or" || word == "able" || word == "less"
        no_suffix << word
      else
  		  no_suffix << word.gsub(@@suffix_regex , "")
      end
  	end
  	no_suffix
  end

  def self.delete_s(no_suffix)
  	no_s = []
  	no_suffix.each do |x|
    	if x == "is" || x == "was" || x == "as" || x == "this"
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
