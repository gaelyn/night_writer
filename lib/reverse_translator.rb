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
    "Created #{ARGV[1]} containing #{@braille.length / 6} characters"
  end

  def braille_to_array
    if @braille.length > 242
      multi_line_braille_to_array
    else
      @braille.split
    end
  end

  def multi_line_braille_to_array
    split_array = @braille.split
    result = []
    for i in 0..2 do
      result.push(split_array[i] + split_array[i += 3])
    end
    result
  end

  def split_out_letters
    split_lines = braille_to_array.map do |line|
      line.scan(/.{1,2}/m)
    end

    split_lines[0].zip(split_lines[1], split_lines[2])
  end

  def write_english(message)
    @original.write(message)
    @original.close
  end

  def read_original
    File.open(ARGV[1], "r").read
  end

  def translate
    split_out_letters.map do |char|
      dictionary.english_hash[char]
    end.join
  end
end
