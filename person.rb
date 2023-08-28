class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age?
  end

  private

  def of_age?
    @age >= 18 || @parent_permission
  end
end

person1 = Person.new(24, 'Andrea')
p 'CLASS PERSON'
p person1.name
p person1.age
p person1.id
p person1.can_use_services?
person1.name = 'Oscar'
person1.age = 16
p person1.name
p person1.age
p person1.can_use_services?
