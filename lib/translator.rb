class Translator
  attr_reader :message,
              :braille,
              :dictionary
  def initialize (message, braille)
    @message = message
    @braille = braille
    @dictionary = Dictionary.new
  end

  def welcome
    puts "Created #{ARGV[1]} containing #{@message.length} characters"
  end

  def write_braille(message)
    @braille.write(message)
    @braille.close
  end

  def read_braille
    read_braille = File.open(ARGV[1], "r").read
  end

  def message_to_array
    @message.chars
  end

  def line1
    message_to_array.map do |letter|
      @dictionary.line1[letter]
    end
  end

  def line2
    message_to_array.map do |letter|
      @dictionary.line2[letter]
    end
  end

  def line3
    message_to_array.map do |letter|
      @dictionary.line3[letter]
    end
  end

  def translate
    new_array = [line1, line2, line3]

    new_array.flat_map do |line|
      line.join + "\n"
    end.join
  end
end
