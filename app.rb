require_relative 'book'
require_relative 'student'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'rental'
require_relative 'preserve_books'
require_relative 'preserve_people'
require_relative 'preserve_rentals'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = PreservePeople.new.gets_people || []
    @books = PreserveBooks.new.gets_books || []
    @rentals = PreserveRentals.new.gets_rentals(@people, @books) || []
  end

  def list_all_books
    if @books.empty?
      puts "\nNo books yet"
    else
      puts "\nBooks:"
      @books.each_with_index { |book, index| puts "#{index}: #{book.title} by #{book.author}" }
    end
  end

  def list_all_people
    if @people.empty?
      puts "\nNo people yet"
    else
      @people.each_with_index do |person, index|
        puts "#{index}: [#{person.class}] name: #{person.name} ID: #{person.id} Age: #{person.age}"
      end
    end
  end

  def create_a_person
    print 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]: '
    option = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp

    case option
    when 1
      create_student(age, name)
      puts 'Student created successfully'
    when 2
      create_teacher(age, name)
      puts 'Teacher created successfully'
    else
      puts 'Incorrect option, try again'
      create_a_person
    end
  end

  def create_student(age, name)
    print 'Classroom: '
    classroom = gets.chomp
    Classroom.new(classroom)

    print 'Parent permission [y/n]: '
    permission = gets.chomp.downcase == 'y'

    @people.push(Student.new(age, classroom, name, '', parent_permission: permission))
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp

    @people.push(Teacher.new(age, specialization, name, ''))
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    @books.push(Book.new(title, author))
  end

  def create_a_rental
    puts 'Select a book from the following list by number: '
    list_all_books
    book_idx = gets.chomp.to_i

    puts "\nSelect a person from the following list by number (not ID): "
    list_all_people
    person_idx = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @rentals.push(Rental.new(date, @books[book_idx], @people[person_idx]))

    puts 'Rental created successfully'
  end

  def list_all_rentals_for_person
    puts 'Select from the following the ID you want to see the rentals: '
    list_all_people
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "#{rental.date}, book #{rental.book.title} by #{rental.book.author}" if rental.person.id == id
    end
  end

  def end_app
    PreserveBooks.new.save_books(@books)
    PreservePeople.new.save_people(@people)
    PreserveRentals.new.save_rentals(@rentals)
    puts 'Thank you for using this app (•◡•)丿'
    exit
  end
end
