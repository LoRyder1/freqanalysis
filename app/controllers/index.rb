get '/' do

  # get last ten documents uploaded and saved to database for history sidebar
  @lasttendoc = Document.all.order(:created_at).reverse_order.limit(10)
  
  erb :index
end

post '/upload' do 

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

  Word.create!(document_id: doc.id, word_array: @doc_parsed)

  erb :upload
end

post '/analysis' do 

  @lasttendoc = Document.all.order(:created_at).reverse_order.limit(10)

  @doc = Document.last

  words = Word.find_by(document_id: @doc.id)

  # deleting the s and suffixes for appropriate words
  stemmed = words.word_stemmer

  @doc.update_attributes(stemmed: stemmed)

  top_25_sorted_word_count = @doc.word_count_sort

  @top15 = top_25_sorted_word_count[0..14] 
  @top16to25 = top_25_sorted_word_count[15..25]

  erb :analysis

end





