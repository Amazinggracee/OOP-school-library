require_relative '../classes/classroom'
require_relative '../classes/student'

describe Student do
  context 'Testing the functionality of class Student' do
    it 'Should create an instance of Student' do
      student = Student.new(25, 'Jimmy', true)
      expect(student).to be_a Student
    end

    it 'Set the classroom' do
      student = Student.new(25, 'Jimmy', true)
      my_classroom = Classroom.new('Computer Science')
      student.classroom = student.classroom = (my_classroom)
      expect(my_classroom).to be_a Classroom
      expect(student.classroom.label).to eq 'Computer Science'
    end

    it 'Should return an emoji' do
      student = Student.new(25, 'Jimmy', true)
      expect(student.play_hooky).to eq '¯\(ツ)/¯'
    end
  end
end
