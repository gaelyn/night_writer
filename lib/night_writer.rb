message = File.open(ARGV[0], "r")
read_message = message.read.chomp
message.close
puts read_message

braille = read_message.upcase
write_braille = File.open(ARGV[1], "w")
result = write_braille.write(braille)
write_braille.close

puts "created #{ARGV[1]} containing #{result} characters"
