require_relative '../classes/classroom'
require_relative '../classes/book'
require_relative '../classes/person'

# RSpec.describe Rental do
#   let(:date) { '2023-06-28' }
#   let(:book) { Book.new('Title', 'Author') }
#   let(:person) { Person.new(25, 'John Doe') }
#   subject { described_class.new(date, book, person) }

#   describe '#initialize' do
#     it 'creates a new rental with the specified date, book, and person' do
#       expect(subject.date).to eq(date)
#       expect(subject.book).to eq(book)
#       expect(subject.person).to eq(person)
#     end

#     it 'adds the rental to the book and person' do
#       expect(book.rentals).to include(subject)
#       expect(person.rentals).to include(subject)
#     end
#   end

#   describe '#to_h' do
#     it 'returns a hash representation of the rental' do
#       expected_hash = {
#         _class: 'Rental',
#         object_id: subject.object_id,
#         date: date,
#         book: book,
#         person: person
#       }
#       expect(subject.to_h).to eq(expected_hash)
#     end
#   end
# end
