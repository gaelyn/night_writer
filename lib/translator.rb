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
      split_line_1 = []
      until line1.length == 0
        split_line_1 << line1.slice!(0..79)
      end
      return split_line_1
    else
      line1
    end
  end

  def line2
    line2 = message_to_array.map do |letter|
      @dictionary.line2[letter]
    end.join

    if line2.length > 80
      split_line_2 = []
      until line2.length == 0
        split_line_2 << line2.slice!(0..79)
      end
      return split_line_2
    else
      line2
    end
  end

  def line3
    line3 = message_to_array.map do |letter|
      @dictionary.line3[letter]
    end.join

    if line3.length > 80
      split_line_3 = []
      until line3.length == 0
        split_line_3 << line3.slice!(0..79)
      end
      return split_line_3
    else
      line3
    end
  end

  # def line1
  #   message_to_array.map do |letter|
  #     @dictionary.line1[letter]
  #   end
  # end
  #
  # def line2
  #   message_to_array.map do |letter|
  #     @dictionary.line2[letter]
  #   end
  # end
  #
  # def line3
  #   message_to_array.map do |letter|
  #     @dictionary.line3[letter]
  #   end
  # end

  # def translate
  #   new_array = [line1, line2, line3]
  #
  #   new_array.flat_map do |line|
  #     line.join + "\n"
  #   end.join
  # end

  # def translate
  #  variable_line_1 = line1.join
  #  variable_line_2 = line2.join
  #  variable_line_3 = line3.join
  #  new_array = []
  #  until variable_line_1.length == 0
  #    new_array << variable_line_1.slice!(0..79) + "\n"
  #    new_array << variable_line_2.slice!(0..79) + "\n"
  #    new_array << variable_line_3.slice!(0..79) + "\n"
  #  end
  #  new_array.join
  # end

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
