require_relative 'student'

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def students=(student)
    @students.append(student)
    student.classroom = self
  end
end
