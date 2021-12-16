require './corrector'
require './person'
require './rental'

class Person
  attr_reader :id
  attr_accessor :name, :age, :parent_permission, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def can_use_services?
    is_of_age? || @parent_permission == true
  end

  def validate_name
    @corrector.correct_name(@name)
  end

  def is_of_age?
    @age >= 18
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private :is_of_age?
end
