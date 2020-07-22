

class Author
  attr_reader :books

  def initialize(attributes)
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @books = []
  end

  def name
    @first_name + " " + @last_name
  end

  def write(title, year)
    @books << Book.new({author_first_name: "#{@first_name}", author_last_name: "#{@last_name}", title: title, year: year})
  end

end
