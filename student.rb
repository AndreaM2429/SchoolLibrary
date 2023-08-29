require_relative 'person'

class Student < Person
  attr_reader :classroom
  
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
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
