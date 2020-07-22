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
    # require 'pry'; binding.pry
  end







end
