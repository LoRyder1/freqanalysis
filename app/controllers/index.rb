get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/analyze' do 

  dc = Document.new(file: params[:file])
  dc.save

  # Have to find the location from CarrierWave Object
  file_location = dc.file.file.file

  doc = Docx::Document.open(file_location)

  passages = Document.paragraphs(doc)

  full_text = Document.combine(passages)

  @full_text_read = full_text.join

  @document_parsed = Document.downcase_split(full_text)

  # getting rid of apostrophes and suffixes using regex
  no_suffix = Word.delete_suffix(@document_parsed)

  # deleting the s for appropriate words
  no_s = Word.delete_s(no_suffix)

  doc_word_count = Document.count_words(no_s)

  @top_25_sorted_word_count = Document.sorted_word_count(doc_word_count)

  erb :analysis

end





