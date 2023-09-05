require 'json'

class PreserveBooks
  def get_books
    if File.exist?('./books.json')
      saved_books = []
      file = File.read( './books.json' )
      data_hash = JSON.parse(file)
      data_hash.each { |book| saved_books << Book.new(book["title"], book["author"]) }
      saved_books
    end
  end

  def save_books(books)
    unless books.empty?
      data_hash = []
      books.each_with_index { |book, index| data_hash << {:title => book.title, :author => book.author} }
      File.write( './books.json' , JSON.dump(data_hash))
    end
  end
end
