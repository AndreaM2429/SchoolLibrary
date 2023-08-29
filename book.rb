class Book
  attr_accessor :title, :author
  attr_reader :book_rentals

  def initialize(title, author)
    @title = title
    @author = author
    @book_rentals = []
  end

  def new_rental(book)
    @book_rentals.push(book)
    book.book_rental = self
  end
end
