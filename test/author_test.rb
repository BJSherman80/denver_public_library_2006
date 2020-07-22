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






end
