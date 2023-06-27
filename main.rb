require './classes/app'

def intro
  puts '=============================='
  puts 'Welcome to School Library App!'
  puts '=============================='
end

def separator
  puts ''
  puts ' -------------------------------------------------'
  puts ''
end

# Choose from option 1 to 7
def display_options
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

# Execute method based on the option chosen
def execute_option(option, app)
  case option
  when '1'
    app.list_books
  when '2'
    app.list_people
  when '3'
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    app.create_person
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    app.list_all_rentals
  else
    puts 'You entered a wrong input, please try again'
  end
end

def main
  app = App.new
  intro
  loop do
    display_options
    option = gets.chomp
    if option == '7'
      app.exit_app
    else
      separator
      execute_option(option, app)
      separator
    end
  end
end

main
