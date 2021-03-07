require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'
require './lib/dictionary'

class TranslatorTest < Minitest::Test

  def setup
    @message = File.open(ARGV[0], "r")
    @read_message = @message.read.chomp
    @braille = File.open(ARGV[1], "w+")
    @read_braille = File.open(ARGV[1], "r")
    @translator = Translator.new(@read_message, @braille)
  end

  def test_it_exists
    skip
    assert_instance_of Translator, @translator
  end

  def test_it_has_attributes
    skip
    #Use mocks and stubs here
    assert_equal "a", @translator.message
    assert_instance_of File, @translator.braille
    assert_instance_of Dictionary, @translator.dictionary
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

  def test_it_can_translate_two_letters
    skip
    assert_equal "0.0.\n..0.\n....\n", @translator.translate
  end
end
