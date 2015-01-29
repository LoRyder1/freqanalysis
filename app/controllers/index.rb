get '/' do

  # get last ten documents uploaded and saved to database for history sidebar
  @lasttendoc = Document.all.order(:created_at).reverse_order.limit(10)
  
  erb :index
end

post '/analyze' do 

  # get last ten documents uploaded and saved to database for history sidebar
  @lasttendoc = Document.all.order(:created_at).reverse_order.limit(10)

  doc = Document.new(file: params[:file])
  doc.save

  # Have to find the location from CarrierWave Object
  file_location = doc.file.file.file

  # many of these methods are in the model
  @text = Document.add_document(file_location)

  doc.update_attributes(text: @text)


  # getting rid of apostrophes punctuations
  @doc_parsed = doc.document_parse


  words = Word.new(document_id: doc.id, word_array: @doc_parsed)
  words.save

  # deleting the s and suffixes for appropriate words
  stemmed = words.word_stemmer


  doc_word_count = Document.count_words(stemmed)

  @top_25_sorted_word_count = Document.sorted_word_count(doc_word_count)

  @top15 = @top_25_sorted_word_count[0..14] 
  @top16to25 = @top_25_sorted_word_count[15..25]

  erb :analysis

end





