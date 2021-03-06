message, braille = ARGV
@message_read = File.read("./#{message}")
@message_open = File.open("./#{message}")
@braille_file = braille
puts "created #{braille} containing #{@message_read.length - 1} characters"
