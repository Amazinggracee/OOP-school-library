require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'preserve_data'

class App
  def initialize
    @people = read_file('./data/people.json')
    @books = read_file('./data/books.json')
    @rentals = read_file('./data/rentals.json')
  end

  # option 1 - List all books
  def list_books
    @books = read_file('./data/books.json')
    puts 'No book yet!' if @books.empty?
    @books.each { |book| puts "Title: \"#{book['title']}\", Author: \"#{book['author']}\" Rentals: #{book['rentals']}" }
  end

  # option 2 - List all people
  def list_people
    @people = read_file('./data/people.json')
    puts 'We do not have people yet' if @people.empty?
    @people.each do |person|
      puts "Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}, Rentals: #{person['rentals']}"
    end
  end

  # Create a student
  def create_student(name, age)
    print 'Has parent permission? [Y/N]: '
    permission = gets.downcase == 'y'
    @people << Student.new(age, name, permission)
    write_file(@people, './data/people.json')
    puts 'Person created successfully'
  end

  # Create a teacher
  def create_teacher(name, age)
    print 'Specialization: '
    specialization = gets.chomp.capitalize
    @people << Teacher.new(specialization, age, name)
    write_file(@people, './data/people.json')
    puts 'Person created successfully'
  end

  # option 3 - Create a person
  def create_person
    option = gets.chomp
    print 'Name: '
    name = gets.chomp.capitalize
    print 'Age: '
    age = gets.to_i
    if option == '1'
      create_student(name, age)
    elsif option == '2'
      create_teacher(name, age)
    else
      puts "You entered a wrong input, it's either 1 (for a new student) or 2 (for a new teacher)"
    end
  end

  # option 4 - Create a book
  def create_book
    puts '------- Creating a book ----------'
    print 'Title: '
    title = gets.chomp.capitalize
    print 'Author: '
    author = gets.chomp.capitalize
    @books << Book.new(title, author)
    write_file(@books, './data/books.json')
    puts 'Book created successfully'
  end

  # Handle selecting a book
  def select_book
    @books = read_file('./data/books.json')
    puts 'Select a book from the following list by number (not by id)'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book['title']}\", Author: \"#{book['author']}\"" }
  end

  # Handle selecting a person
  def select_person
    @people = read_file('./data/people.json')
    puts 'Select a person from the following list by number (not by id)'
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
  end

  # option 5 - Create a rental
  def create_rental
    if @books.empty? || @people.empty?
      puts 'There are no books or people to create a rental'
      return
    end

    select_book
    book_id = gets.chomp.to_i

    select_person
    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @books[book_id], @people[person_id])
    write_file(@rentals, './data/rentals.json')
    puts 'Rental created successfully'
  end

  # option 6 - List all rentals for a given person id
  def list_all_rentals
    @rentals = read_file('./data/rentals.json')
    puts '=================== PEOPLE ==================='
    list_people
    puts '=============================================='
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      if rental['person']['id'] == id
        puts "Date: #{rental['date']}, Book: \"#{rental['book']['title']}\" by #{rental['book']['author']}"
      end
    end
  end

  # option 7 - Exit
  def exit_app
    puts '============================='
    puts 'Thank you for using this app!'
    puts '============================='
    exit
  end
end
