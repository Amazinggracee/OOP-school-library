require_relative './person'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'

# Create a person object
person = Person.new(22, 'maximilianus')
puts "Original name: #{person.correct_name}"

# Apply the CapitalizeDecorator
capitalized_person = CapitalizeDecorator.new(person)
puts "Capitalized name: #{capitalized_person.correct_name}"

# Apply the TrimmerDecorator
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts "Capitalized and trimmed name: #{capitalized_trimmed_person.correct_name}"
