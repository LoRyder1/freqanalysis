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



# require 'docx'

# class Document
#   attr_reader :text

#   @@suffix_regex = /ed\z|ing\z|ly\z|er\z|or\z|ion\z|ible\z|able\z|al\z|ial\z|ness\z|ity\z|ty\z|ment\z|ic\z|ous\z|eous\z|ious\z|en\z|ive\z|ative\z|itive\z|ful\z|less\z|est\z/

#   def initialize
#     @hash = Hash.new(0)
#     @text = []
#     @word_array = Word.new
#   end

#   def count_words
#     @no_suffix.each do |value| 
#       @hash.store(value, @hash[value]+1) 
#     end
#     @hash   
#   end

#   def add_document(file)
#     Docx::Document.open(file) do |d|
#       @text << d.text
#     end
#   end

#   def document_parse
#     delete_punc(downcase_split(@text))
#   end

#   private

#   def downcase_split(text)
#     text.join(" ").downcase.split(" ")
#   end

#   def delete_punc(split_text)
#     no_punc = []
#     split_text.each do |word|
#       no_punc << word.gsub(/\W/, "")
#     end
#     no_punc
#   end
# end

# class Word

#   def initialize
#     @word_array = []
#     @no_s = []
#     @no_suffix =[]
#   end

#   def word_stemmer
    
#   end

#   def add_word_array(doc_parsed)
#     @word_array = doc_parsed
#   end

#   def delete_s(word_array)
#     no_s = []
#     word_array.each do |x|
#       if x == "is" || x == "was" || x == "as" || x == "this" #|| x == "has" #|| x.chars.last(3).join == "ous"
#         no_s << x
#       elsif x.chars.last == "s" 
#         no_s << x.chomp("s")
#       else
#         no_s << x 
#       end
#     end
#     no_s
#   end

#   def delete_suffix
#     @no_s.each do |word|
#       if word == "fact" || word == "for" || word == "or" || word == "able" || word == "less"
#         @no_suffix << word
#       else
#         @no_suffix << word.gsub(@@suffix_regex , "")
#       end
#     end
#     @no_suffix
#   end

# end


# doc = Document.new
# doc.add_document("test.docx")
# # p doc.text
# doc_parse =  doc.document_parse
# p doc_parse

# word_array = Word.new
# word_array.add_word_array(doc_parse)

# # p word_array.delete_s(doc.document_parse)

# # p doc.downcase_split
# # p doc.delete_punc
# # p doc.delete_s
# # p doc.delete_suffix

# # p doc.count_words

