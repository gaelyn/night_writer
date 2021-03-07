require './lib/translator'

  message = File.open(ARGV[0], "r")
  read_message = message.read.chomp
  braille = File.open(ARGV[1], "w")
  translator = Translator.new(read_message, braille)
  translator.write_braille(translator.translate)
