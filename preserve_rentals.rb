require 'json'

class PreserveRentals
  def gets_rentals(people, books)
    return unless File.exist?('./rentals.json')

    saved_rentals = []
    file = File.read('./rentals.json')
    data_hash = JSON.parse(file)

    data_hash.each do |rental|
      @rented_book = books.select { |book| book.title == rental['book'] }
      @rented_person = people.select { |person| person.id == rental['person'] }
      saved_rentals << Rental.new(rental['date'], @rented_book[0], @rented_person[0])
    end
    saved_rentals
  end

  def save_rentals(rentals)
    return if rentals.empty?

    data_hash = []
    rentals.each_with_index do |rental, _index|
      data_hash << { date: rental.date, book: rental.book.title, person: rental.person.id }
    end
    File.write('./rentals.json', JSON.dump(data_hash))
  end
end
