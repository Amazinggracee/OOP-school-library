require_relative '../classes/person'
require_relative '../classes/rental'
require_relative '../classes/book'

describe Person do
  context 'Create an instance of person and test methods' do
    it 'Create an instance of the class person with parameters name and parent permission as default' do
      person = Person.new(22)
      expect(person).to be_a Person
    end

    # it 'Test the correct name method' do
    #   person = Person.new(22)
    #   correct = person.correct_name
    #   expect(correct).to eq 'Unknown'
    #   expect(person.parent_permission).to eq true
    # end

    it 'Test can use services method' do
      person = Person.new(23, 'Hika')
      use_service = person.can_use_services?
      expect(use_service).to eq true
    end

    it 'Test add rental method' do
      person = Person.new(34, 'Lils')
      book = Book.new('the dark', 'Myles')
      rent = Rental.new('2021-11-22', book, person)
      expect(person.rentals).to include(rent)
    end
  end
end
