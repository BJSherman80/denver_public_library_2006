require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'
require 'pry'

class AuthorTest < Minitest::Test

  def test_it_exists
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_instance_of Author, charlotte_bronte
    assert_equal "Charlotte Bronte", charlotte_bronte.name
    assert_equal [], charlotte_bronte.books
  end



  def test_author_can_write_a_book
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = Book.new({author_first_name: "Charlotte", author_last_name: "Bronte" , title: "Jane Eyre", publication_date: "October 16, 1847"})

    assert_instance_of Book, jane_eyre
    assert_equal "Jane Eyre", jane_eyre.title
  end

  def test_author_can_write_multiple_books
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    villette = charlotte_bronte.write("Villette", "1853")
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    assert_equal [villette, jane_eyre], charlotte_bronte.books
  end









end
