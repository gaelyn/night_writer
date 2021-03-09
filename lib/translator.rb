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
    "Created #{ARGV[1]} containing #{@message.length} characters"
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
    line1 = message_to_array.map do |letter|
      @dictionary.line1[letter]
    end.join

    if line1.length > 80
      split_line(line1)
    else
      line1
    end
  end

  def line2
    line2 = message_to_array.map do |letter|
      @dictionary.line2[letter]
    end.join

    if line2.length > 80
      split_line(line2)
    else
      line2
    end
  end

  def line3
    line3 = message_to_array.map do |letter|
      @dictionary.line3[letter]
    end.join

    if line3.length > 80
      split_line(line3)
    else
      line3
    end
  end

  def split_line(line)
    split_line = []
    until line.length == 0
      split_line << line.slice!(0..79)
    end
    return split_line
  end

  def translate
    if @message.length <= 40
      new_array = [line1, line2, line3]
      new_array.flat_map do |line|
        line + "\n"
      end.join
    else
      translate_over_40
    end
  end

  def translate_over_40
    i = line1.count
    result = []
    for i in 0..(line1.length - 1) do
      result << line1[i]
      result << line2[i]
      result << line3[i]
    end
    result.join("\n")
  end
end
