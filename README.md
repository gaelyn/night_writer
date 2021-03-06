## Intro
The general pattern is that we will run the program, providing an existing file
for input, and the name of a nonexistent file for output, and the program will
provide us with a confirmation:
`$ ruby ./lib/night_writer.rb message.txt braille.txt`
`Created 'braille.txt' containing 256 characters`
That will use the plaintext file message.txt to create a Braille simulation
file braille.txt.

## Iteration 1 Creating a Command Line Interface
* `./lib/night_writer.rb` is the path to your Ruby program
* `message.txt` is the name of an existing file in your project directory.
* `braille.txt` is the name that we would like to give to a file that we will create in iteration 2
* 256 is the count of characters in your `message.txt` file.

Created my './lib/night_writer.rb' file.  
I know I need to puts something to the terminal after my input so
I am hardcoding the sentence above.  
`Created 'braille.txt' containing 256 characters`   
Then try to interpolate using ARGV.
Create a `message.txt` file.
In `./lib/night_writer` I put the following:   
`message, braille = ARGV`  
This will take two arguments from the command line  
`message_file = File.read("./lib/#{message}")`   
This takes the first argument of message.txt and makes the file readable  
`puts "created #{braille} containing #{message_file.length - 1} characters"`  
This interpolates the two arguments into a string that will print to the command line. I had to subtract 1 from length because whatever I put in message.txt will have a new line added automatically and adds an extra character.
## Iteration 2 Writing Braille
* Update your existing program so that you can create a new file containing Braille characters.
* Use lowercase letters a-z   
* Each line of braille file should be no more than 40 Braille characters (80 dots)
wide.

1. Update your existing program to take the entire message contained in your input file and save it to the output file provided by a user
1. Create a dictionary (module?) that allows you to look up a letter and find the Braille equivalent.
1. Take input file with a single letter and create an output file with the Braille equivalent.
1. Then take multiple letters
1. Take messages of more than 80 characters are split over multiple lines.  

## Iteration 3
## Iteration 4
