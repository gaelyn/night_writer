require './lib/reverse_translator'
require './lib/dictionary'

  braille = File.open(ARGV[0], "r")
  read_braille = braille.read.chomp
  message = File.open(ARGV[1], "w")
  reverse = ReverseTranslator.new(read_braille, message)

  puts reverse.welcome
  reverse.write_english(reverse.translate)
