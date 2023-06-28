require_relative '../classes/teacher'

describe Teacher do
  context 'Create an instance of teacher and test methods' do
    it 'Create an instance of teacher' do
      teacher = Teacher.new('Software', 22, 'Joy')
      expect(teacher).to be_a Teacher
    end
    it 'Testing can use services method' do
      teacher = Teacher.new('Software', 22, 'Joy')
      use_services = teacher.can_use_services?
      expect(use_services).to eq true
    end
  end
end
