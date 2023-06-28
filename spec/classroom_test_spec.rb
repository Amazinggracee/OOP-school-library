require_relative '../classes/classroom'
require_relative '../classes/student'

RSpec.describe Classroom do
  let(:label) { 'Class A' }
  subject { described_class.new(label) }
  describe '#initialize' do
    it 'creates a new classroom with the specified label' do
      expect(subject.label).to eq(label)
      expect(subject.students).to be_empty
    end
  end
  describe '#students=' do
    let(:student) { double('Student') }
    it 'adds the student to the classroom and sets the classroom for the student' do
      expect(student).to receive(:classroom=).with(subject)
      subject.students = student
      expect(subject.students).to include(student)
    end
  end
end
