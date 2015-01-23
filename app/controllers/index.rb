get '/' do
  # Look in app/views/index.erb
  # erb :index

  @doc = Docx::Document.open('example.docx')

  @paragraphs = []
  @doc.paragraphs.each do |p|
  	@paragraphs << p
  end

  @first = @paragraphs[8].text
  @test = @first.gsub(/[^a-z]/i, "")

  # raise @test.inspect

  @yo = @first.downcase.split(" ")

  @drama = []

  @yo.each do |x|
  	@drama << x.gsub(/[^a-z]/i, "")
  end

  test1 = "talk, talks, talked, talking"

  prc = test1.downcase.split(" ")
  @yep =[]

  prc.each do |x|
  	@yep << x.gsub(/[^a-z]|ed|ing/i, "")
  end

  @crazy = []
  @yep.each do |x|
  	if x.chars.last == "s"
  		@crazy << x.chomp("s")
  	else
  		@crazy << x
  	end
  end

  raise @crazy.inspect

  raise @yep.inspect

  erb :analysis
end
