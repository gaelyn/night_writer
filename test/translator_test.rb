require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'
require './lib/dictionary'

class TranslatorTest < Minitest::Test

  def setup
    @message = File.open(ARGV[0], "r")
    @read_message = @message.read.chomp
    @braille = File.open(ARGV[1], "w+")
    @translator = Translator.new(@read_message, @braille)
  end

  def test_it_exists
    assert_instance_of Translator, @translator
  end

  def test_it_has_attributes
    assert_equal "a", @translator.message
    assert_instance_of File, @translator.braille
    assert_instance_of Dictionary, @translator.dictionary
  end

  def test_it_can_print_welcome_message
    assert_equal "Created braille.txt containing 1 characters", @translator.welcome
  end

  def test_it_can_turn_message_into_array
    assert_equal ["a"], @translator.message_to_array
  end

  def test_it_can_write_to_new_file
    @translator.write_braille("0.")

    assert_equal "0.", @translator.read_braille
  end

  def test_it_can_split_into_3_lines
    assert_equal "0.", @translator.line1
    assert_equal "..", @translator.line2
    assert_equal "..", @translator.line3
  end

  def test_it_can_translate
    assert_equal "0.\n..\n..\n", @translator.translate
  end

  def test_it_can_break_lines_at_40_characters
    new_message = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
    translator = Translator.new(new_message, @braille)

    assert_equal "\n", translator.translate[80]
  end
end
