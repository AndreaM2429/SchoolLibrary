require 'json'

class PreserveBooks
  def gets_books
    return unless File.exist?('./books.json')

    saved_books = []
    file = File.read('./books.json')
    data_hash = JSON.parse(file)
    data_hash.each { |book| saved_books << Book.new(book['title'], book['author']) }
    saved_books
  end

  def save_books(books)
    return if books.empty?

    data_hash = []
    books.each_with_index { |book, _index| data_hash << { title: book.title, author: book.author } }
    File.write('./books.json', JSON.dump(data_hash))
  end
end
