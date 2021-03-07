class Translator
  attr_reader :message,
              :braille,
              :dictionary
  def initialize (message, braille)
    @message = message
    @braille = braille
    # puts "created #{ARGV[1]} containing #{@message.length} characters"
    @dictionary = Dictionary.new
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

  def convert
    message_to_array.map do |letter|
      @dictionary.braille_hash[letter]
    end
  end

  def line1
    convert.map do |array|
      array[0]
    end
  end

  def line2
    convert.map do |array|
      array[1]
    end
  end

  def line3
    convert.map do |array|
      array[2]
    end
  end

  def translate
    new_array = [line1, line2, line3]

    new_array.flat_map do |line|
      line.join + "\n"
    end.join
  end

end
