require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'student'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

# TEST FOR DECORATOR

p 'TEST FOR DECORATOR'

person1 = Person.new(22, 'maximilianus')
person1.correct_name
capitalized_person = CapitalizeDecorator.new(person1)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

# TEST FOR CLASSROOM AND STUDENT RELATION

p 'TEST FOR CLASSROOM AND STUDENT RELATION'

student = Student.new(18, 3, 'Andrea')
student2 = Student.new(18, 3, 'Oscar')

classroom = Classroom.new(4)

p classroom.classroom_students
p student.classroom

classroom.add_student(student)
classroom.add_student(student2)

p student.classroom

p classroom.classroom_students

# TEST FOR BOOK AND RENTAL RELATION

p 'TEST FOR BOOK AND RENTAL RELATION'

book1 = Book.new('title 1', 'Author 1')

rental1 = Rental.new('20-08-2022', book1, person1)
rental2 = Rental.new('24-07-2023', book1, person1)

book1.new_rental(rental1)
book1.new_rental(rental2)

p book1.book_rentals.count

# TEST FOR PERSON AND RENTAL RELATION

p 'TEST FOR PERSON AND RENTAL RELATION'

person2 = Person.new(19, 'Marco')

person2.add_rental(rental1)
person2.add_rental(rental2)
person1.add_rental(rental1)

p person2.person_rentals.count

p rental1.person
