require_relative 'decorator'

class TrimmerDecorator
  def correct_name
    @nameable.correct_name.strip.slice(0, 10) if @nameable.name.length > 10
  end
end
