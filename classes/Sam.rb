require_relative './person'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'

# Create a person object
person = Person.new(22, 'maximilianus')
puts "Original name: #{person.correct_name}"

# Apply the CapitalizeDecorator
capitalizedPerson = CapitalizeDecorator.new(person)
puts "Capitalized name: #{capitalizedPerson.correct_name}"

# Apply the TrimmerDecorator
capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
puts "Capitalized and trimmed name: #{capitalizedTrimmedPerson.correct_name}"
