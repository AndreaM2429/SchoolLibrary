require_relative '../rental'
require_relative '../student'
require_relative '../book'

describe Rental do 
  context "When testing the rental class" do 
    
    
    it "should return the rental date: 06/09/2023" do 
        @student = Student.new(10, '3a', '', 'Nicolas', parent_permission: true)
        @book = Book.new('Harry Potter: La orden del Fenix', 'J.K. Rowling')
        @rental = Rental.new('06/09/2023', @book, @student)
        puts @rental.date
        expect(@rental.date).to eq '06/09/2023'
    end

    it "should return the rental book: Harry Potter: La orden del Fenix" do 
      @student = Student.new(10, '3a', '', 'Nicolas', parent_permission: true)
      @book = Book.new('Harry Potter: La orden del Fenix', 'J.K. Rowling')
      @rental = Rental.new('06/09/2023', @book, @student)
      puts @rental.book.title
      expect(@rental.book.title).to eq 'Harry Potter: La orden del Fenix'
    end

    it "should return the rental Person: Nicolas" do 
      @student = Student.new(10, '3a', '', 'Nicolas', parent_permission: true)
      @book = Book.new('Harry Potter: La orden del Fenix', 'J.K. Rowling')
      @rental = Rental.new('06/09/2023', @book, @student)
      puts @rental.person.name
      expect(@rental.person.name).to eq 'Nicolas'
    end
  end
end