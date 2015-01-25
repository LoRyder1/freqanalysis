require 'spec_helper'
require 'docx'

describe "Word" do 

	before(:each) do
   #  @doc = Docx::Document.open("test.docx")
	  # passages = Document.paragraphs(@doc)
	  # @full_text = Document.combine(passages)
	  # @document_parsed = Document.downcase_split(@full_text)

	  @doc_parsed = ["talk", "talked", "talks,", "talking", "cat.", "cat's"]
	  @no_suffix = ["talk", "talk", "talks", "talk", "cat", "cats", "is", "was"]
  end

	it "deletes the intended suffix ed" do 
		expect(Word.delete_suffix(@doc_parsed)).not_to include("talked")
	end

	it "deletes the intended suffix ing" do 
		expect(Word.delete_suffix(@doc_parsed)).not_to include("talking")
	end

	it "deletes the apostrophes, commas, or periods from words" do 
		expect(Word.delete_suffix(@doc_parsed)).not_to include(",")
		expect(Word.delete_suffix(@doc_parsed)).not_to include(".")
		expect(Word.delete_suffix(@doc_parsed)).not_to include("'")
	end

	it "delete extra s from pluralized nouns and verbs" do 
		expect(Word.delete_s(@no_suffix)).not_to include("talks")
		expect(Word.delete_s(@no_suffix)).not_to include("cats")
	end

	it "does not delete s from 'is' or 'was' " do 
		expect(Word.delete_s(@no_suffix)).not_to include("i")
		expect(Word.delete_s(@no_suffix)).not_to include("wa")
	end



	# it "combines passages for full text" do 
	#   expect(@full_text.join).to be_kind_of String
	# end

	# it "parses the document by downcasing and splitting into words" do
	# 	expect(@document_parsed[2]).to eq "bottom"
	# end

	# it "counts the words in a document" do 
	#   @doc_word_count = Document.count_words(["the", "the", "car", "car", "car"])
	# 	expect(@doc_word_count["car"]).to eq 3
	# end

	# it "sorts the word count and retrieves top 25 occurrences" do 
	# 	no_suffix = Word.delete_suffix(@document_parsed)
	# 	no_s = Word.delete_s(no_suffix)
	# 	doc_word_count = Document.count_words(no_s)
	#   @top_25_sorted_word_count = Document.sorted_word_count(doc_word_count)
	# 	expect(@top_25_sorted_word_count[1][0]).to eq "of"
	# 	expect(@top_25_sorted_word_count.length).to eq 25
	# end

end
