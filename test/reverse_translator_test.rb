require 'minitest/autorun'
require 'minitest/pride'
require './lib/reverse_translator'
require './lib/dictionary'

class ReverseTranslatorTest < Minitest::Test

  def setup
    @braille = File.open(ARGV[0], "r")
    @read_braille = @braille.read.chomp
    @original_message = File.open(ARGV[1], "w+")
    # @read_original = File.open(ARGV[1], "r")
    @reverse = ReverseTranslator.new(@read_braille, @original_message)
  end

  def test_it_exists
    skip
    assert_instance_of ReverseTranslator, @reverse
  end

  def test_it_has_attributes
    skip
    assert_equal "0.\n..\n..", @reverse.braille
    assert_instance_of File, @reverse.original
    assert_instance_of Dictionary, @reverse.dictionary
  end

  def test_it_can_print_welcome_message
    skip
    assert_equal "Created original.txt containing 8 characters", @reverse.welcome
  end

  def test_it_can_turn_braille_into_array
    skip
    assert_equal ["0.", "..", ".."], @reverse.braille_to_array
  end

  def test_it_can_write_to_new_file
    # skip
    @reverse.write_english("a")

    assert_equal "a", @reverse.read_original
  end
end
