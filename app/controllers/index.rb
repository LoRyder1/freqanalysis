get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/analyze' do 

  dc = Document.new(file: params[:file])
  dc.save

  # Have to find the location from CarrierWave Object
  file_location = dc.file.file.file

  @doc = Docx::Document.open(file_location)

  @paragraphs = []
  @doc.paragraphs.each do |p|
    @paragraphs << p
  end

  full_text = []
  @paragraphs.each do |x|
    full_text << x.text
  end

  # raise full_text.inspect

  @full_text_join = full_text.join(" ").downcase.split(" ")

  #getting rid of apostrophes and suffixes using regex
  @nosuffix = []
  @full_text_join.each do |x|
    @nosuffix << x.gsub(/\W|ed|ing/, "")
  end

  @no_s = []
  @nosuffix.each do |x|
    if x == "is" || x == "was" 
      @no_s << x
    elsif x.chars.last == "s" 
      @no_s << x.chomp("s")
    else
      @no_s << x 
    end
  end

  # @no_s.each do |stem|
  #     Word.create!(document_id: document.id, stem: stem)
  # end

  #create a hash for word count
  h = Hash.new(0)
  @no_s.each do |v|
    h.store(v, h[v]+1)
  end

  sorted_word_count =  h.sort_by {|key, value| value}


  @last_five = sorted_word_count.last(10).reverse


  # @test = ["health", "healthing", "healthed", "healths", "crazy", "crazys", "crazyed", "drama", "dramed", "frame", "framed", "frameing"]

  erb :analysis

end





