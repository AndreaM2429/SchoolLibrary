require_relative '../classroom'
require_relative '../student'

describe Classroom do
  it 'Create a new Classroom class object' do
    classroom = Classroom.new('8160901')
    expect(classroom.class).to eq Classroom
  end

  it 'Create a classroom and add a student' do
    classroom101 = Classroom.new('8160101')
    student = Student.new(19, classroom101, '', 'Catalina')

    classroom = Classroom.new('8160901')
    classroom.add_student(student)
    expect(classroom.classroom_students.length).to eq 1
    expect(classroom.classroom_students[0].name).to eq 'Catalina'
  end
end
