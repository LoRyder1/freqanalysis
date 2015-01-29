class Document < ActiveRecord::Base
	has_many :words
	mount_uploader :file, FileUploader


  def self.add_document(file)
    text = []
    Docx::Document.open(file) do |d|
      text << d.text
    end
    text[0]
  end

  def document_parse
    delete_punc(downcase_split(self.text))
  end


  def self.count_words(stemmed_word_array)
    hash = Hash.new(0)
    stemmed_word_array.each do |value| 
      hash.store(value, hash[value]+1) 
    end
    hash    
  end

  def self.sorted_word_count(word_count)
    sorted = word_count.sort_by {|key, value| value}
    sorted.last(25).reverse
  end

  private

  def downcase_split(text)
    text.downcase.split(" ")
  end

  def delete_punc(split_text)
    no_punc = []
    split_text.each do |word|
      no_punc << word.gsub(/\W/, "")
    end
    no_punc
  end
end
