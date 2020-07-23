require './lib/author'
require './lib/book'

class Library
  attr_reader :name, :books, :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []

  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      books << book
    end
  end

  def publiction_time_frame_for(author)
    {start: author.oldest_book_publication_year,
    end: author.newest_book_publication_year}
  end

  def checkout(book)            #
    if book_is_available?(book)
      book.check_out!
      true
    else
      false
    end
  end

  def return(book)
    book.return!
  end

  def most_popular_book
      @books.max_by do |book|
        book.times_checked_out
    end
  end

  def checked_out_books
    @books.find_all do |book|
      book.checked_out?
    end
  end


  private

  def book_is_available?(book)
     @books.include?(book) && (book.checked_out? == false)
  end
end
