get '/' do
  # Look in app/views/index.erb
  # erb :index

  document = Document.find_by(filename: "example1.docx")

  @doc = Docx::Document.open(document.filename)

  @paragraphs = []
  @doc.paragraphs.each do |p|
  	@paragraphs << p
  end

  full_text = []
  @paragraphs.each do |x|
    full_text << x.text
  end

  @full_text_join = full_text.join(" ").downcase.split(" ")

  # raise @full_text_join.inspect

  # @first = @paragraphs[8].text

  # @yo = @first.downcase.split(" ")


  #getting rid of apostrophes and suffixes usign regex
  @nosuffix = []
  @full_text_join.each do |x|
  	@nosuffix << x.gsub(/[^a-z]|ed|ing/i, "")
  end

  # @drama2 = []
  # @drama.each do |x|
  #   if x.chars.last == "s" && x != "is" && x != "was"
  #     @drama2 << x.chomp("s")
  #   else
  #     @drama2 << x 
  #   end
  # end

  #######

  # test1 = "talk, talks, talked, talking"

  # prc = test1.downcase.split(" ")
  # @yep =[]

  # prc.each do |x|
  # 	@yep << x.gsub(/[^a-z]|ed|ing/i, "")
  # end

  # @crazy = []
  # @yep.each do |x|
  # 	if x.chars.last == "s"
  # 		@crazy << x.chomp("s")
  # 	else
  # 		@crazy << x
  # 	end
  # end



  erb :analysis
end
