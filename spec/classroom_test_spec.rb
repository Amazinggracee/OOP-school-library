require_relative '../classes/classroom'
require_relative '../classes/student'

describe Classroom do
  context 'Creating classroom' do
    it 'should create an instance of a class Classroom' do
      classroom = Classroom.new('Art')
      expect(classroom).to be_a Classroom
    end
    # it 'adds student to the classroom' do
    #   classroom = Classroom.new('Art')
    #   student_a = Student.new(23, 'Mona', true)
    #   student_b = Student.new(21, 'John', true)
    #   classroom.students = classroom.students = (student_a)
    #   classroom.students = classroom.students = (student_b)
    #   expect(student_a.classroom.label).to eq 'Art'
    #   expect(classroom.students).to include student_a
    #   expect(classroom.students.length).to eq 2
    # end
  end
end
