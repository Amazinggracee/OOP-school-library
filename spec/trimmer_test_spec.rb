require_relative '../classes/person'
require_relative '../classes/trimmer_decorator'
require_relative '../classes/capitalize_decorator'

describe CapitalizeDecorator do
  context 'Create an instance of trimmer and test functionality'

  it 'should trim the first name' do
    person = Person.new(22, 'satoshinakamoto')
    capitalize_person = CapitalizeDecorator.new(person)
    trimmed_person = TrimmerDecorator.new(capitalize_person).correct_name
    expect(trimmed_person).to eq 'Satoshinak'
  end
end
