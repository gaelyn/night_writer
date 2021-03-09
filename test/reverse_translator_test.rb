require 'minitest/autorun'
require 'minitest/pride'
require './lib/reverse_translator'
require './lib/dictionary'

class ReverseTranslatorTest < Minitest::Test

  def setup
    @braille = File.open(ARGV[0], "r")
    @read_braille = @braille.read.chomp
    @original_message = File.open(ARGV[1], "w+")
    @reverse = ReverseTranslator.new(@read_braille, @original_message)
  end

  def test_it_exists
    # skip
    assert_instance_of ReverseTranslator, @reverse
  end

  def test_it_has_attributes
    # skip
    assert_equal "0.\n..\n..", @reverse.braille
    assert_instance_of File, @reverse.original
    assert_instance_of Dictionary, @reverse.dictionary
  end

  def test_it_can_print_welcome_message
    # skip
    assert_equal "Created original.txt containing 1 characters", @reverse.welcome
  end

  def test_it_can_turn_braille_into_array
    # skip
    assert_equal ["0.", "..", ".."], @reverse.braille_to_array
  end

  def test_it_can_write_to_new_file
    # skip
    @reverse.write_english("a")
    assert_equal "a", @reverse.read_original
  end

  def test_it_can_split_lines_back_to_braille_arrays
    skip
    #used "ab" to test this instead of "a"
    assert_equal [["0.", "..", ".."], ["0.", "0.", ".."]], @reverse.split_out_letters
  end

  def test_it_can_translate_to_english
    # skip
    assert_equal "a", @reverse.translate
  end
end
