require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'
require 'pry'

class AuthorTest < Minitest::Test

  def test_it_exists
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_instance_of Author, charlotte_bronte
  end

  def test_author_has_name
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_equal "Charlotte Bronte", charlotte_bronte.name
  end

  def test_author_has_no_books
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_equal [], charlotte_bronte.books
  end

  def test_author_can_write_a_book
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    assert_equal jane_eyre, charlotte_bronte.books

  end

  def test_author_can_write_multiple_books
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    villette = charlotte_bronte.write("Villette", "1853")
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    assert_equal villette, jane_eyre, charlotte_bronte.books
  end

    







end
