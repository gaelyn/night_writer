class ReverseTranslator
  attr_reader :braille,
              :original,
              :dictionary
  def initialize (braille, original)
    @braille = braille
    @original = original
    @dictionary = Dictionary.new
  end

  def welcome
    "Created #{ARGV[1]} containing #{@braille.length} characters"
  end
end
