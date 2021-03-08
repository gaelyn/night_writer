require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'
require './lib/dictionary'

class TranslatorTest < Minitest::Test

  def setup
    @message = File.open(ARGV[0], "r")
    @read_message = @message.read.chomp
    @braille = File.open(ARGV[1], "w+")
    # @read_braille = File.open(ARGV[1], "r")
    @translator = Translator.new(@read_message, @braille)
  end

  def test_it_exists
    skip
    assert_instance_of Translator, @translator
  end

  def test_it_has_attributes
    skip
    assert_equal "a", @translator.message
    assert_instance_of File, @translator.braille
    assert_instance_of Dictionary, @translator.dictionary
  end

  def test_it_can_print_welcome_message
    skip
    assert_equal "Created newfile.txt containing 1 characters", @translator.welcome
  end

  def test_it_can_turn_message_into_array
    skip
    assert_equal ["a"], @translator.message_to_array
  end

  def test_it_can_write_to_new_file
    skip
    @translator.write_braille("0.")

    assert_equal "0.", @translator.read_braille
  end

  def test_it_can_split_into_3_lines
    skip
    assert_equal ["0."], @translator.line1
    assert_equal [".."], @translator.line2
    assert_equal [".."], @translator.line3
  end

  def test_it_can_translate
    skip
    assert_equal "0.\n..\n..\n", @translator.translate
  end
end
