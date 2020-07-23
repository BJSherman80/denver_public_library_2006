require 'minitest/autorun'
require 'minitest/pride'
require './lib/library'
require './lib/author'
require 'pry'

class LibraryTest < Minitest::Test

  def test_it_exists
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    professor = charlotte_bronte.write("The Professor", "1857")
    assert_instance_of Library, dpl
      assert_equal "Denver Public Library", dpl.name
      assert_equal [], dpl.books
      assert_equal [], dpl.authors
      assert_equal 0, professor.times_checked_out
  end

  def test_it_can_add_authors_and_books
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    assert_equal [charlotte_bronte, harper_lee], dpl.authors
    assert_equal [jane_eyre, professor, villette, mockingbird], dpl.books
  end

  def test_it_can_calculate_publication_time
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    assert_equal ({:stary => "1847", :end => "1857"}), dpl. publiction_time_frame_for(charlotte_bronte)

  end

  def test_it_can_calculate_publication_time
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")


    refute dpl.checkout(mockingbird)
    refute dpl.checkout(jane_eyre)
    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)
    assert dpl.checkout(jane_eyre)
    assert_equal [jane_eyre], dpl.checked_out_books

    assert_equal false, dpl.checkout(jane_eyre)
  end

  def test_it_can_calculate_publication_time
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

     dpl.checkout(jane_eyre)
    assert_equal [jane_eyre], dpl.checked_out_books
    dpl.return
    assert_equal [], dpl.checked_out_books
  end

  def test_it_can_calculate_publication_time
    dpl = Library.new("Denver Public Library")
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

  dpl.add_author(charlotte_bronte)
  dpl.add_author(harper_lee)

  dpl.checkout(professor)
  dpl.return(professor)
  dpl.checkout(professor)

  dpl.checkout(mockingbird)

  assert_equal professor, dpl.most_popular_book

end

def test_it_returs

  






end
