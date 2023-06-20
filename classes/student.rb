require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name, parent_permission)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.include?(self) ? classroom.students : classroom.students.append(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
