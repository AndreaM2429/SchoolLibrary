require_relative '../book'
require_relative '../student'

describe Book do
  person = Student.new(24, '1b', '', 'Andrea')

  it 'Create a new Book class object' do
    book = Book.new('Los miserables', 'Victor Hugo')
    expect(book.class).to eq Book
  end

  it 'Create a new book with the title Red Queen' do
    book = Book.new('Red Queen', 'Victoria Aveyard')
    title = book.title
    expect(title).to eq 'Red Queen'
  end

  it 'Create a new book and a rental associated with it' do
    book = Book.new('Five Chimneys', 'Olga Lengyel')
    book.new_rental(person, '20-07-2022')

    book_rented = book.rentals[0].book
    rental_date = book.rentals[0].date

    expect(book_rented).to eq book
    expect(rental_date).to eq '20-07-2022'
  end
end
