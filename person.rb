require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :id
  attr_reader :rentals, :parent_permission

  def initialize(age, name = 'Unknown', id, parent_permission: true)
    super()
    @id = if id == ''
            Random.rand(1...1000)
          else
            id
          end
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
