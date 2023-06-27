require_relative './person'

class Student < Person
  attr_reader :classroom
  attr_accessor :parent_permission, :age, :name

  def initialize(age, name, _parent_permission, classroom = ' ')
    super(age, name, parent_permission: true)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.include?(self) ? classroom.students : classroom.students.append(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def to_h
    {
      _class: self.class.name,
      object_id: object_id,
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      rentals: @rentals,
      classroom: @classroom
    }
  end
end
