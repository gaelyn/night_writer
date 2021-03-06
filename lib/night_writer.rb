message, braille = ARGV
message_open = File.open("./#{message}").read
# message = message_open.read
# braille_file = braille
braille_file = File.open("./#{braille}", "w")
puts "created #{braille} containing #{message_open.length - 1} characters"

# braille_file.puts "I wrote this!"
braille_file.puts message_open
# braille_file.close
