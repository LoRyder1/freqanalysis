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

  erb :analysis
end
