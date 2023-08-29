require_relative 'book'

class Rental
  attr_accessor :date, :books, :person

  def initialize(date, books, person)
    @date = date
    @books = books
    @person = person
  end

  def book_rental=(book)
    @books = book
    book.book_rentals.push(self) unless book.book_rentals.include?(self)
  end

  def person_rental=(person)
    @person = person
    person.person_rentals.push(self) unless person.person_rentals.include?(self)
  end
end
