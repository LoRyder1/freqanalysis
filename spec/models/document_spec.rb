require 'spec_helper'
require 'docx'

describe "Document Parsing" do 

	before(:each) do
    @doc = Docx::Document.open("test.docx")
	  passages = Document.paragraphs(@doc)
	  @full_text = Document.combine(passages)
	  @document_parsed = Document.downcase_split(@full_text)
  end

	it "gets paragraphs from document" do 
		expect(Document.paragraphs(@doc)).to be_kind_of Array
	end

	it "combines passages for full text" do 
	  expect(@full_text.join).to be_kind_of String
	end

	it "parses the document by downcasing and splitting into words" do
		expect(@document_parsed[2]).to eq "bottom"
	end

	it "counts the words in a document" do 
	  @doc_word_count = Document.count_words(["the", "the", "car", "car", "car"])
		expect(@doc_word_count["car"]).to eq 3
	end

	it "sorts the word count and retrieves top 25 occurrences" do 
		no_suffix = Word.delete_suffix(@document_parsed)
		no_s = Word.delete_s(no_suffix)
		doc_word_count = Document.count_words(no_s)
	  @top_25_sorted_word_count = Document.sorted_word_count(doc_word_count)
		expect(@top_25_sorted_word_count[1][0]).to eq "of"
		expect(@top_25_sorted_word_count.length).to eq 25
	end

end




  


