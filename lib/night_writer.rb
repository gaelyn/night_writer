message, braille = ARGV
message_file = File.read("./#{message}")
puts "created #{braille} containing #{message_file.length - 1} characters"
