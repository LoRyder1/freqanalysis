require 'spec_helper'
require 'docx'

describe Document do 
	it "gets paragraphs from document" do 
		doc = Docx::Document.open("test.docx")
		expect(Document.paragraphs(doc)).to be_kind_of Array
	end
end
