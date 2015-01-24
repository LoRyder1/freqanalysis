get '/' do
  # Look in app/views/index.erb
  # erb :index

  document = Document.find(filename: "example1.docx")

  @doc = Docx::Document.open(document.filename)

  @paragraphs = []
  @doc.paragraphs.each do |p|
  	@paragraphs << p
  end

  @first = @paragraphs[8].text
  @test = @first.gsub(/[^a-z]/i, "")

  @yo = @first.downcase.split(" ")

  @drama = []

  @yo.each do |x|
  	@drama << x.gsub(/[^a-z]|ed|ing/i, "")
  end

  @drama2 = []
  @drama.each do |x|
    if x.chars.last == "s" && x != "is" && x != "was"
      @drama2 << x.chomp("s")
    else
      @drama2 << x 
    end
  end

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
