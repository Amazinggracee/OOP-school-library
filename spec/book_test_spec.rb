require_relative '../classes/book'
require_relative '../classes/rental'
require_relative '../classes/student'

RSpec.describe Book do
  let(:book_title) { 'The Great Gatsby' }
  let(:book_author) { 'F. Scott Fitzgerald' }
  let(:person) { double('Person') }
  let(:date) { '2023-06-28' }

  subject { described_class.new(book_title, book_author) }

  describe '#initialize' do
    it 'creates a new book with title and author' do
      expect(subject.title).to eq(book_title)
      expect(subject.author).to eq(book_author)
      expect(subject.rentals).to be_empty
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the book' do
      expected_hash = {
        _class: 'Book',
        object_id: subject.object_id,
        title: book_title,
        author: book_author,
        rentals: []
      }
      expect(subject.to_h).to eq(expected_hash)
    end
  end

  describe '#add_rental' do
    it 'creates a new rental for the book with the specified person and date' do
      rental = subject.add_rental(person, date)
      expect(rental).to be_a(Rental)
      expect(rental.book).to eq(subject)
      expect(rental.person).to eq(person)
      expect(rental.date).to eq(date)
    end
  end
end
