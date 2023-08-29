require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :person_rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @person_rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @person_rentals.push(rental)
    rental.person_rental = self
  end

  private

  def of_age?
    @age >= 18
  end
end
