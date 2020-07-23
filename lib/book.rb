require 'pry'

class Book
  attr_reader :title, :times_checked_out
  def initialize(attributes)
    @title = attributes[:title]
    @author_first_name = attributes[:author_first_name]
    @author_last_name = attributes[:author_last_name]
    @publication_date = attributes[:publication_date]
    @times_checked_out = 0
    @checked_out = false
  end

  def author
    @author_first_name + " " + @author_last_name
  end

  def publication_year
    @publication_date.split.last
  end

  def check_out!
    @times_checked_out += 1
    @checked_out = true
  end

  def return!
    @checked_out
  end

  def checked_out?
    @checked_out
  end
end
