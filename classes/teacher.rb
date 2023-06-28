require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(specialization, age, name, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_h
    {
      _class: self.class.name,
      object_id: object_id,
      id: @id,
      name: @name,
      age: @age,
      specialization: @specialization,
      rentals: @rentals
    }
  end
end
