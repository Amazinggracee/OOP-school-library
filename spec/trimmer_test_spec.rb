require_relative '../classes/person'
require_relative '../classes/trimmer_decorator'
require_relative '../classes/capitalize_decorator'

RSpec.describe TrimmerDecorator do
  let(:nameable) { double('Nameable', correct_name: 'VeryLongNameThatNeedsTrimming') }
  subject { described_class.new(nameable) }

  describe '#correct_name' do
    it 'trims the name to a maximum of 10 characters' do
      expect(nameable).to receive(:correct_name).and_return('VeryLongNa')
      expect(subject.correct_name).to eq('VeryLongNa')
    end
  end
end
