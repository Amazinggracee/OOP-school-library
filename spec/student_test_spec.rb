require_relative '../classes/classroom'
require_relative '../classes/student'

RSpec.describe Student do
  let(:age) { 16 }
  let(:name) { 'John Doe' }
  let(:parent_permission) { true }
  let(:classroom) { double('Classroom', students: []) }

  subject { described_class.new(age, name, parent_permission, classroom) }

  describe '#initialize' do
    it 'creates a new student with the specified age, name, parent permission, and classroom' do
      expect(subject.age).to eq(age)
      expect(subject.name).to eq(name)
      expect(subject.parent_permission).to eq(parent_permission)
      expect(subject.classroom).to eq(classroom)
      expect(subject.rentals).to be_empty
    end
  end

  describe '#classroom=' do
    it 'sets the classroom and adds the student to the classroom' do
      expect(classroom.students).not_to include(subject)
      subject.classroom = classroom
      expect(subject.classroom).to eq(classroom)
      expect(classroom.students).to include(subject)
    end

    it 'does not add the student to the classroom if already present' do
      classroom.students << subject
      expect(classroom.students).to include(subject)
      subject.classroom = classroom
      expect(classroom.students.count(subject)).to eq(1)
    end
  end

  describe '#play_hooky' do
    it 'returns a string representing playing hooky' do
      expect(subject.play_hooky).to eq('¯\(ツ)/¯')
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the student' do
      expected_hash = {
        _class: 'Student',
        object_id: subject.object_id,
        id: subject.id,
        name: name,
        age: age,
        parent_permission: parent_permission,
        rentals: [],
        classroom: classroom
      }
      expect(subject.to_h).to eq(expected_hash)
    end
  end
end
