class Classroom
  attr_accessor :label
  attr_reader :classroom_students

  def initialize(label)
    @label = label
    @classroom_students = []
  end

  def add_student(student)
    @classroom_students.push(student)
    student.classroom = self
  end
end
