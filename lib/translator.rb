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

  def translate
    result = message_to_array.map do |letter|
      @dictionary.braille_hash[letter]
    end

    line1 = result.map do |array|
      array[0]
    end
    line2 = result.map do |array|
      array[1]
    end
    line3 = result.map do |array|
      array[2]
    end

    new_array = [line1, line2, line3]

    joined = new_array.flat_map do |line|
      line.join + "\n"
    end.join

    # write_braille(joined)
  end

  # def translate1
  #   message_to_array.each do |letter|
  #     write_braille(@dictionary.line1[letter])
  #   end
  # end
  #
  # def translate2
  #   message_to_array.each do |letter|
  #     write_braille(@dictionary.line2[letter])
  #   end
  # end
  #
  # def translate3
  #   message_to_array.each do |letter|
  #     write_braille(@dictionary.line3[letter])
  #   end
  # end
  #
  # def translate_all
  #   "#{translate1}\n#{translate2}\n#{translate3}"
  # end
end
