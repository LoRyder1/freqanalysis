require 'spec_helper'
require 'docx'

describe "Word Parsing" do 

	before(:each) do
	  @doc_parsed = ["talk", "talked", "talks,", "talking", "cat.", "cat's"]
	  @no_suffix = ["talk", "talk", "talks", "talk", "cat", "cats", "is", "was"]
  end

	it "deletes the intended suffix ed" do 
		expect(@doc_parsed).to include("talked")
		expect(Word.delete_suffix(@doc_parsed)).not_to include("talked")
	end

	it "deletes the intended suffix ing" do 
		expect(@doc_parsed).to include("talking")
		expect(Word.delete_suffix(@doc_parsed)).not_to include("talking")
	end

	it "deletes the commas from words" do 
		expect(@doc_parsed).to include("talks,")
		expect(Word.delete_suffix(@doc_parsed)).not_to include("talks,")
	end

	it "deletes the periods from words" do 
		expect(@doc_parsed).to include("cat.")
		expect(Word.delete_suffix(@doc_parsed)).not_to include("cat.")
	end

	it "deletes the apostrophes from words" do 
		expect(@doc_parsed).to include("cat's")
		expect(Word.delete_suffix(@doc_parsed)).not_to include("cat's")
	end

	it "delete extra s from pluralized nouns and verbs" do 
		expect(Word.delete_s(@no_suffix)).not_to include("talks")
		expect(Word.delete_s(@no_suffix)).not_to include("cats")
	end

	it "does not delete s from 'is' or 'was' " do 
		expect(Word.delete_s(@no_suffix)).not_to include("i")
		expect(Word.delete_s(@no_suffix)).not_to include("wa")
	end

end
