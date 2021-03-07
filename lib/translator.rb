class Translator
  attr_reader :braille_hash,
              :message,
              :braille
  def initialize (message, braille)
    @message = message
    @braille = braille
    # write_braille
    @braille_hash = {"a" => ["0.", "..", ".."],
                "b" => ["0.", "0.", ".."],
                "c" => ["00", "..", ".."],
                "d" => ["00", ".0", ".."],
                "e" => ["0.", ".0", ".."],
                "f" => ["00", "0.", ".."],
                "g" => ["00", "00", ".."],
                "h" => ["0.", "00", ".."],
                "i" => [".0", "0.", ".."],
                "j" => [".0", "00", ".."],
                "k" => ["0.", "..", "0."],
                "l" => ["0.", "0.", "0."],
                "m" => ["00", "..", "0."],
                "n" => ["00", ".0", "0."],
                "o" => ["0.", ".0", "0."],
                "p" => ["00", "0.", "0."],
                "q" => ["00", "00", "0."],
                "r" => ["0.", "00", "0."],
                "s" => [".0", "0.", "0."],
                "t" => [".0", "00", "0."],
                "u" => [".0", "..", "00"],
                "v" => ["0.", "0.", "00"],
                "w" => [".0", "00", ".0"],
                "x" => ["00", "..", "00"],
                "y" => ["00", ".0", "00"],
                "z" => ["0.", ".0", "00"]
}
  end

  def write_braille(message)
    @braille.write(message)
  end

  def translate
    new = @braille_hash.find_all do |key, value|
      if key == @message
        write_braille(value.join("\n"))
      end
    end
    new[0][1].join("\n")
  end

end
