require_relative '../classes/person'
require_relative '../classes/rental'
require_relative '../classes/book'

RSpec.describe Person do
  let(:age) { 20 }
  let(:name) { 'John Doe' }
  let(:parent_permission) { true }
  subject { described_class.new(age, name, parent_permission: parent_permission) }

  describe '#initialize' do
    it 'creates a new person with the specified age, name, and parent permission' do
      expect(subject.age).to eq(age)
      expect(subject.name).to eq(name)
      expect(subject.rentals).to be_empty
    end

    it 'generates a random ID between 1 and 2000' do
      expect(subject.id).to be_between(1, 2000).inclusive
    end
  end

  describe '#correct_name' do
    it 'returns the name as-is' do
      expect(subject.correct_name).to eq(name)
    end
  end

  describe '#can_use_services?' do
    context 'when the person is of age' do
      let(:age) { 25 }

      it 'returns true' do
        expect(subject.can_use_services?).to be true
      end
    end

    context 'when the person is underage with parent permission' do
      let(:age) { 15 }

      it 'returns true' do
        expect(subject.can_use_services?).to be true
      end
    end

    context 'when the person is underage without parent permission' do
      let(:age) { 15 }
      let(:parent_permission) { false }

      it 'returns false' do
        expect(subject.can_use_services?).to be false
      end
    end
  end

  describe '#add_rental' do
    let(:rental) { double('Rental') }

    it 'adds the rental to the person' do
      subject.add_rental(rental)
      expect(subject.rentals).to include(rental)
    end
  end
end
