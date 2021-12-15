require './corrector'

class Person
  attr_reader :id
  attr_accessor :name, :age, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
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

  private :is_of_age?
end
