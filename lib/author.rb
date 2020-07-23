require 'pry'

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
    new_book = Book.new({author_first_name: @first_name, author_last_name: @last_name, title: title, publication_date: year})
    @books << new_book
    new_book
  end

  def oldest_book_publication_year
    @books.min_by do |book|
      book.publication_year
    end
  end

    def newest_book_publication_year
      @books.max_by do |book|
        book.publication_year
      end
    end


  end
