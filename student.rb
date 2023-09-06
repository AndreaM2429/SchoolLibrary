require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, id, name = 'Unknown', parent_permission: true)
    super(age, id, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.classroom_students.push(self) unless classroom.classroom_students.include?(self)
  end
end
